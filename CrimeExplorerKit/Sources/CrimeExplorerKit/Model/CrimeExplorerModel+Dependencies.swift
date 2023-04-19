import CoreLocation
import Foundation

extension CrimeExplorerModel.Dependencies {

    static let locationService: LocationService = LocationCLService(locationManager: CLLocationManager())

    public static var live: Self {
        return .init(
            location: locationService.location,
            startUpdatingLocation: locationService.startUpdating,
            stopUpdatingLocation: locationService.stopUpdating
        )
    }

    public static var preview: Self {
        .init(
            location: .init(CLLocation(latitude: 51.507222, longitude: -0.1275)),
            startUpdatingLocation: { },
            stopUpdatingLocation: { }
        )
    }

}
