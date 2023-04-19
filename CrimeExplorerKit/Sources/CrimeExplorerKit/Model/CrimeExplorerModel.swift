//
//  CrimeExplorerModel.swift
//  CrimeExplorer
//
//  Created by Adam Young on 19/04/2023.
//

import Combine
import CoreLocation
import MapKit
import PoliceAPI
import SwiftUI

@MainActor
public class CrimeExplorerModel: ObservableObject {

    public struct Dependencies {
        let location: CurrentValueSubject<CLLocation?, Never>
        let neighbourhood: (Coordinate) async throws -> Neighbourhood?
    }

    @Published public var region: MKCoordinateRegion
    @Published public private(set) var currentLocation: CLLocation?
    @Published public private(set) var currentNeighbourhood: Neighbourhood?

    private let backgroundScheduler = DispatchQueue.global(qos: .userInitiated)
    private let dependencies: Dependencies
    private var cancellables = Set<AnyCancellable>()

    public init(
        initialRegion: MKCoordinateRegion = .uk,
        dependencies: Dependencies
    ) {
        self.region = initialRegion
        self.dependencies = dependencies

        dependencies.location
            .compactMap { $0 }
            .removeDuplicates()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] location in
                guard let self else {
                    return
                }

                self.currentLocation = location
            }
            .store(in: &cancellables)

        $currentLocation
            .compactMap { $0 }
            .first()
            .map { location in
                MKCoordinateRegion(
                    center: location.coordinate,
                    span: MKCoordinateSpan(
                        latitudeDelta: 0.01,
                        longitudeDelta: 0.01
                    )
                )
            }
            .sink { [weak self] region in
                guard let self else {
                    return
                }

                self.region = region
            }
            .store(in: &cancellables)

        $region
            .dropFirst(2)
            .throttle(for: .seconds(2), scheduler: backgroundScheduler, latest: true)
            .removeDuplicates()
            .sink { [weak self] region in
                self?.updateNeighbourhood(in: region)
            }
            .store(in: &cancellables)
    }

    func moveRegionToCurrentLocation() {
        guard let currentLocation else {
            return
        }

        region = MKCoordinateRegion(
            center: currentLocation.coordinate,
            span: MKCoordinateSpan(
                latitudeDelta: 0.01,
                longitudeDelta: 0.01
            )
        )
    }

}

extension CrimeExplorerModel {

    private func updateNeighbourhood(in region: MKCoordinateRegion) {
        Task {
            let coordinate = Coordinate(region: region)
            let neighbourhood = try? await dependencies.neighbourhood(coordinate)
            self.currentNeighbourhood = neighbourhood
        }
    }

}
