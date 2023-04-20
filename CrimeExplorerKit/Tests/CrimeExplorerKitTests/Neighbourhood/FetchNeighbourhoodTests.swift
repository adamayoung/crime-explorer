@testable import CrimeExplorerKit
import PoliceAPI
import XCTest

final class FetchNeighbourhoodTests: XCTestCase {

    var useCase: FetchNeighbourhood!
    var neighbourhoodService: NeighbourhoodMockService!

    override func setUp() {
        super.setUp()
        neighbourhoodService = NeighbourhoodMockService()
        useCase = FetchNeighbourhood(neighbourhoodService: neighbourhoodService)
    }

    override func tearDown() {
        useCase = nil
        neighbourhoodService = nil
        super.tearDown()
    }

    func testExecuteReturnNeighbourhood() async throws {
        let neighbourhoodPolicingTeamDataModel = PoliceAPI.NeighbourhoodPolicingTeam(
            force: "123",
            neighbourhood: "ABC"
        )
        neighbourhoodService.neighbourhoodPolicingTeamResult = .success(neighbourhoodPolicingTeamDataModel)

        let neighbourhoodDataModel = PoliceAPI.Neighbourhood(
            id: "ABC",
            name: "Test Neighbourhood",
            policeForceWebsite: try XCTUnwrap(URL(string: "https://some.domain.com/about")),
            population: 999,
            centre: Coordinate(latitude: 1.1, longitude: 2.2)
        )
        neighbourhoodService.neighbourhoodResult = .success(neighbourhoodDataModel)

        let coordinate = CrimeExplorerKit.Coordinate(latitude: 1.1, longitude: 2.2)
        let expectedNeighbourhood = CrimeExplorerKit.Neighbourhood(
            id: "ABC",
            name: "Test Neighbourhood",
            center: Coordinate(latitude: 1.1, longitude: 2.2)
        )

        let neighbourhood = try await useCase.execute(at: coordinate)

        XCTAssertEqual(neighbourhood, expectedNeighbourhood)
    }

}
