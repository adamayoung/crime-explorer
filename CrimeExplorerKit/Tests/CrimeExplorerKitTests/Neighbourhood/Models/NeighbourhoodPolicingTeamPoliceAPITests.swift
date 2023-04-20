@testable import CrimeExplorerKit
import PoliceAPI
import XCTest

final class NeighbourhoodPolicingTeamPoliceAPITests: XCTestCase {

    func testInitWithPoliceAPINeighbourhoodPolicingTeam() {
        let policeAPINeighbourhoodPolicingTeam = PoliceAPI.NeighbourhoodPolicingTeam(force: "123", neighbourhood: "ABC")

        let neighbourhoodPolicingTeam = CrimeExplorerKit.NeighbourhoodPolicingTeam(
            neighbourhoodPolicingTeam: policeAPINeighbourhoodPolicingTeam
        )

        XCTAssertEqual(neighbourhoodPolicingTeam.policeForceID, "123")
        XCTAssertEqual(neighbourhoodPolicingTeam.neighbourhoodID, "ABC")
    }

}
