@testable import CrimeExplorerKit
import MapKit
import XCTest

final class MKCoordinateRegionLocationsTests: XCTestCase {

    func testUK() {
        let region = MKCoordinateRegion.uk

        XCTAssertEqual(region.center.latitude, 54.4661645479556)
        XCTAssertEqual(region.center.longitude, -3.1076525162671667)
        XCTAssertEqual(region.span.latitudeDelta, 13.0738)
        XCTAssertEqual(region.span.longitudeDelta, 11.4748)
    }

}
