@testable import CrimeExplorerKit
import PoliceAPI
import XCTest

final class NeighbourhoodPoliceAPITests: XCTestCase {

    func testInitWithPoliceAPINeighbourhood() throws {
        let policeAPINeighbourhood = PoliceAPI.Neighbourhood(
            id: "ABC",
            name: "Test neighbourhood",
            policeForceWebsite: try XCTUnwrap(URL(string: "https://some.domain.com/about")),
            population: 999,
            centre: Coordinate(latitude: 2.2, longitude: 3.3)
        )

        let neighbourhood = CrimeExplorerKit.Neighbourhood(neighbourhood: policeAPINeighbourhood)

        XCTAssertEqual(neighbourhood.id, "ABC")
        XCTAssertEqual(neighbourhood.name, "Test neighbourhood")
        XCTAssertEqual(neighbourhood.center.latitude, 2.2)
        XCTAssertEqual(neighbourhood.center.longitude, 3.3)
    }

}
