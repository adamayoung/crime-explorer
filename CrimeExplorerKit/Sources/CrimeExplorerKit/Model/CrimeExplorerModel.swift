//
//  CrimeExplorerModel.swift
//  CrimeExplorer
//
//  Created by Adam Young on 19/04/2023.
//

import Combine
import CoreLocation
import MapKit
import SwiftUI

@MainActor
public class CrimeExplorerModel: ObservableObject {

    public struct Dependencies {
        let location: CurrentValueSubject<CLLocation?, Never>
        let startUpdatingLocation: () -> Void
        let stopUpdatingLocation: () -> Void
    }

    @Published public var region: MKCoordinateRegion
    @Published public private(set) var currentLocation: CLLocation?

    private let dependencies: Dependencies
    private var cancellables = Set<AnyCancellable>()

    public init(
        initialRegion: MKCoordinateRegion = MKCoordinateRegion(
            center: .london,
            span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
        ),
        dependencies: Dependencies
    ) {
        self.region = initialRegion
        self.dependencies = dependencies

        self.dependencies.startUpdatingLocation()

        dependencies.location
            .removeDuplicates()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] location in
                self?.currentLocation = location
            }
            .store(in: &cancellables)
    }

    deinit {
        dependencies.stopUpdatingLocation()
    }

}
