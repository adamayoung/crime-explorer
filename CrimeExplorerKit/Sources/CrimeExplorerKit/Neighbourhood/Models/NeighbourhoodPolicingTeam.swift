import Foundation

public struct NeighbourhoodPolicingTeam {

    public let policeForceID: String
    public let neighbourhoodID: String

    public init(policeForceID: String, neighbourhoodID: String) {
        self.policeForceID = policeForceID
        self.neighbourhoodID = neighbourhoodID
    }

}
