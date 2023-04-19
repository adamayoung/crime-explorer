import CoreLocation
import Foundation
import PoliceAPI

struct ModuleDependencies {

    static var neighbourhoodManager: NeighbourhoodManager {
        NeighbourhoodPoliceAPIManager(neighbourhoodService: policeAPI.neighbourhoods)
    }

    static let locationService: LocationService = LocationCLService(locationManager: CLLocationManager())

}

extension ModuleDependencies {

    private static var policeAPI = UKPoliceAPI()

}
