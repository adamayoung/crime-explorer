import Foundation
import PoliceAPI

final class NeighbourhoodMockService: NeighbourhoodService {

    var neighbourhoodsResult: Result<[NeighbourhoodReference], NeighbourhoodMockService.Error> = .failure(.unknown)

    var neighbourhoodResult: Result<Neighbourhood, NeighbourhoodMockService.Error> = .failure(.unknown)
    private(set) var neighbourhoodLastParameters: (id: String, policeForceID: String)?

    var boundaryResult: Result<[Coordinate], NeighbourhoodMockService.Error> = .failure(.unknown)

    var policeOfficersResult: Result<[PoliceOfficer], NeighbourhoodMockService.Error> = .failure(.unknown)

    var prioritiesResult: Result<[NeighbourhoodPriority], NeighbourhoodMockService.Error> = .failure(.unknown)

    var neighbourhoodPolicingTeamResult: Result<NeighbourhoodPolicingTeam, NeighbourhoodMockService.Error> =
        .failure(.unknown)
    private(set) var neighbourhoodPolicingTeamLastParameter: Coordinate?

    init() { }

    func neighbourhoods(inPoliceForce policeForceID: String) async throws -> [NeighbourhoodReference] {
        try neighbourhoodsResult.get()
    }

    func neighbourhood(withID id: String, inPoliceForce policeForceID: String) async throws -> Neighbourhood {
        neighbourhoodLastParameters = (id, policeForceID)
        return try neighbourhoodResult.get()
    }

    func boundary(forNeighbourhood neighbourhoodID: String,
                  inPoliceForce policeForceID: String) async throws -> [Coordinate] {
        try boundaryResult.get()
    }

    func policeOfficers(forNeighbourhood neighbourhoodID: String,
                        inPoliceForce policeForceID: String) async throws -> [PoliceOfficer] {
        try policeOfficersResult.get()
    }

    func priorities(forNeighbourhood neighbourhoodID: String,
                    inPoliceForce policeForceID: String) async throws -> [NeighbourhoodPriority] {
        try prioritiesResult.get()
    }

    func neighbourhoodPolicingTeam(atCoordinate coordinate: Coordinate) async throws -> NeighbourhoodPolicingTeam {
        neighbourhoodPolicingTeamLastParameter = coordinate
        return try neighbourhoodPolicingTeamResult.get()
    }

}

extension NeighbourhoodMockService {

    enum Error: Swift.Error {
        case unknown
    }

}
