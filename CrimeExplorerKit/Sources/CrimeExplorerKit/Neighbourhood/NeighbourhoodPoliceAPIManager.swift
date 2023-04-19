import Foundation
import PoliceAPI

final class NeighbourhoodPoliceAPIManager: NeighbourhoodManager {

    private let neighbourhoodService: NeighbourhoodService

    init(neighbourhoodService: NeighbourhoodService) {
        self.neighbourhoodService = neighbourhoodService
    }

    func neighbourhood(at coordinate: Coordinate) async throws -> Neighbourhood? {
        let neighbourhoodPolicingTeam = try await neighbourhoodPolicingTeam(at: coordinate)

        let neighbourhoodDataModel = try await neighbourhoodService.neighbourhood(
            withID: neighbourhoodPolicingTeam.neighbourhoodID,
            inPoliceForce: neighbourhoodPolicingTeam.policeForceID
        )

        let neighbourhood = Neighbourhood(neighbourhood: neighbourhoodDataModel)

        return neighbourhood
    }

    func neighbourhoodPolicingTeam(at coordinate: Coordinate) async throws -> NeighbourhoodPolicingTeam {
        let coordinate = PoliceAPI.Coordinate(coordinate: coordinate)
        let neighbourhoodPolicingTeamDataModel = try await neighbourhoodService.neighbourhoodPolicingTeam(
            atCoordinate: coordinate
        )

        let neighbourhoodPolicingTeam = NeighbourhoodPolicingTeam(
            neighbourhoodPolicingTeam: neighbourhoodPolicingTeamDataModel
        )

        return neighbourhoodPolicingTeam
    }

}
