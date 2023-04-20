import CoreLocation
import Foundation
import MapKit
import PoliceAPI

extension Coordinate {

    init(coordinate: PoliceAPI.Coordinate) {
        self.init(latitude: coordinate.latitude, longitude: coordinate.longitude)
    }

    init(coordinate: CLLocationCoordinate2D) {
        self.init(latitude: coordinate.latitude, longitude: coordinate.longitude)
    }

    init(region: MKCoordinateRegion) {
        self.init(latitude: region.center.latitude, longitude: region.center.longitude)
    }

}

extension PoliceAPI.Coordinate {

    init(coordinate: Coordinate) {
        self.init(latitude: coordinate.latitude, longitude: coordinate.longitude)
    }

}
