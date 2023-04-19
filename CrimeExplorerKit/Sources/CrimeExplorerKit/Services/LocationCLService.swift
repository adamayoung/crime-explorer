//
//  File.swift
//  
//
//  Created by Adam Young on 19/04/2023.
//

import Combine
import CoreLocation
import Foundation

public final class LocationCLService: NSObject, LocationService {

    public private(set) var location: CurrentValueSubject<CLLocation?, Never> = .init(nil)

    private let locationManager: CLLocationManaging

    public init(locationManager: CLLocationManaging) {
        self.locationManager = locationManager
        super.init()
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.distanceFilter = kCLDistanceFilterNone
        self.locationManager.delegate = self
    }

    public func startUpdating() {
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }

    public func stopUpdating() {
        locationManager.stopUpdatingLocation()
    }

}

extension LocationCLService: CLLocationManagerDelegate {

    public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {
            return
        }

        self.location.send(location)
    }

}
