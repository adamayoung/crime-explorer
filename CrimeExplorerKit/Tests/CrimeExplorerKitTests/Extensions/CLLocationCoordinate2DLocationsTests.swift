@testable import CrimeExplorerKit
import CoreLocation
import XCTest

final class CLLocationCoordinate2DLocationsTests: XCTestCase {

    func testLondon() {
        let coordinate = CLLocationCoordinate2D.london

        XCTAssertEqual(coordinate.latitude, 51.507222)
        XCTAssertEqual(coordinate.longitude, -0.1275)
    }

}
