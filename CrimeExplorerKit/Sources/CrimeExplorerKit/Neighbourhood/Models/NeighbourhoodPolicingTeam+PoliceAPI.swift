import Foundation
import PoliceAPI

extension NeighbourhoodPolicingTeam {

    init(neighbourhoodPolicingTeam: PoliceAPI.NeighbourhoodPolicingTeam) {
        self.init(
            policeForceID: neighbourhoodPolicingTeam.force,
            neighbourhoodID: neighbourhoodPolicingTeam.neighbourhood
        )
    }

}
