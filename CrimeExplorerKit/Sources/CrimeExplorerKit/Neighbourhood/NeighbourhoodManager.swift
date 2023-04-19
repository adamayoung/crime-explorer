import Foundation

protocol NeighbourhoodManager {

    func neighbourhood(at coordinate: Coordinate) async throws -> Neighbourhood?

}
