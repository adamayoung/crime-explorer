import CoreLocation
import Foundation

public struct Neighbourhood: Identifiable, Equatable, Hashable {

    public let id: String
    public let name: String
    public let center: Coordinate

    public init(id: String, name: String, center: Coordinate) {
        self.id = id
        self.name = name
        self.center = center
    }

}
