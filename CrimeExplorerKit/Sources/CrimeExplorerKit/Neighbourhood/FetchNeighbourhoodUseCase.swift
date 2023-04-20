import Foundation
import PoliceAPI

protocol FetchNeighbourhoodUseCase {

    func execute(at coordinate: Coordinate) async throws -> Neighbourhood?

}
