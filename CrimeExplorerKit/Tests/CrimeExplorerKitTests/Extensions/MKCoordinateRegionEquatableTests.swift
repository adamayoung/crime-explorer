@testable import CrimeExplorerKit
import MapKit
import XCTest

final class MKCoordinateRegionEquatableTests: XCTestCase {

    func testEquals() {
        let region1 = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 51.12345, longitude: -0.12345),
            span: MKCoordinateSpan(latitudeDelta: 1.5, longitudeDelta: 1.5)
        )

        let region2 = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 51.12345, longitude: -0.12345),
            span: MKCoordinateSpan(latitudeDelta: 1.5, longitudeDelta: 1.5)
        )

        XCTAssertEqual(region1, region2)
    }

    func testNotEquals() {
        let region1 = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 51.12345, longitude: -0.12345),
            span: MKCoordinateSpan(latitudeDelta: 1.5, longitudeDelta: 1.5)
        )

        let region2 = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 52.98765, longitude: 0.98765),
            span: MKCoordinateSpan(latitudeDelta: 2.0, longitudeDelta: 2.0)
        )

        XCTAssertNotEqual(region1, region2)
    }

}
