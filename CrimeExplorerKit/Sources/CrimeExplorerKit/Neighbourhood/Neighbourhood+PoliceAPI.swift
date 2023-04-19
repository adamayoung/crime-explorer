import Foundation
import PoliceAPI

extension Neighbourhood {

    init(neighbourhood: PoliceAPI.Neighbourhood) {
        let center = Coordinate(coordinate: neighbourhood.centre)

        self.init(
            id: neighbourhood.id,
            name: neighbourhood.name,
            center: center
        )
    }

}
