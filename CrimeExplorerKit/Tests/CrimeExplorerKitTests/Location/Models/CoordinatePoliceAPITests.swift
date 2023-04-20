import CoreLocation
@testable import CrimeExplorerKit
import MapKit
import PoliceAPI
import XCTest

final class CoordinatePoliceAPITests: XCTestCase {

    func testInitWithPoliceAPICoordinate() {
        let policeAPICoordinate = PoliceAPI.Coordinate(latitude: 2.2, longitude: 3.3)

        let coordinate = CrimeExplorerKit.Coordinate(coordinate: policeAPICoordinate)

        XCTAssertEqual(coordinate.latitude, 2.2)
        XCTAssertEqual(coordinate.longitude, 3.3)
    }

    func testInitWithCoreLocationCoordinate() {
        let clCoordinate = CLLocationCoordinate2D(latitude: 4.4, longitude: 5.5)

        let coordinate = CrimeExplorerKit.Coordinate(coordinate: clCoordinate)

        XCTAssertEqual(coordinate.latitude, 4.4)
        XCTAssertEqual(coordinate.longitude, 5.5)
    }

    func testInitWithMapKitRegion() {
        let mapKitRegion = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 6.6, longitude: 7.7),
            latitudinalMeters: 1.1,
            longitudinalMeters: 2.2
        )

        let coordinate = CrimeExplorerKit.Coordinate(region: mapKitRegion)

        XCTAssertEqual(coordinate.latitude, 6.6)
        XCTAssertEqual(coordinate.longitude, 7.7)
    }

    func testPoliceAPICoordinateInitFromCoordinate() {
        let coordinate = CrimeExplorerKit.Coordinate(latitude: 0.1, longitude: 0.2)

        let policeAPICoordinate = PoliceAPI.Coordinate(coordinate: coordinate)

        XCTAssertEqual(policeAPICoordinate.latitude, 0.1)
        XCTAssertEqual(policeAPICoordinate.longitude, 0.2)
    }

}
