import CoreLocation
import Foundation

extension CrimeExplorerModel.Dependencies {

    static let locationService: LocationService = LocationCLService()

    public static var live: Self {
        return .init(
            location: locationService.location
        )
    }

    public static var preview: Self {
        .init(
            location: .init(CLLocation(latitude: 51.507222, longitude: -0.1275))
        )
    }

}
