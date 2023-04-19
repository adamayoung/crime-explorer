import CoreLocation
import Foundation

extension CrimeExplorerModel.Dependencies {

    public static var live: Self {
        return .init(
            location: ModuleDependencies.locationService.location,
            neighbourhood: ModuleDependencies.neighbourhoodManager.neighbourhood(at:)
        )
    }

    public static var preview: Self {
        .init(
            location: .init(CLLocation(latitude: 51.507222, longitude: -0.1275)),
            neighbourhood: { coordinate in
                Neighbourhood(
                    id: "preview-1",
                    name: "Preview Neighbourhood",
                    center: coordinate
                )
            }
        )
    }

}
