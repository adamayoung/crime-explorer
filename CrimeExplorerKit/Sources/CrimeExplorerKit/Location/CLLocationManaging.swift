import CoreLocation
import Foundation

public protocol CLLocationManaging: AnyObject {

    var desiredAccuracy: CLLocationAccuracy { get set }
    var distanceFilter: CLLocationDistance { get set }
    var delegate: CLLocationManagerDelegate? { get set }

    func requestWhenInUseAuthorization()

    func startUpdatingLocation()

    func stopUpdatingLocation()

}

extension CLLocationManager: CLLocationManaging { }
