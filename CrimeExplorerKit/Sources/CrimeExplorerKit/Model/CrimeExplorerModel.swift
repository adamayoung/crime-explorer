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
    }

    @Published public var region: MKCoordinateRegion
    @Published public private(set) var currentLocation: CLLocation?

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
    }

}
