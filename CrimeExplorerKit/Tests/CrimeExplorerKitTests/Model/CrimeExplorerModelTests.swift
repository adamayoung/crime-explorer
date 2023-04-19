import Combine
import CoreLocation
@testable import CrimeExplorerKit
import MapKit
import SwiftUI
import XCTest

@MainActor
final class CrimeExplorerModelTests: XCTestCase {

    var model: CrimeExplorerModel!
    var cancellables: Set<AnyCancellable>!

    var location: CurrentValueSubject<CLLocation?, Never>!
    var isUpdatingLocation: Bool!

    override func setUp() {
        super.setUp()
        cancellables = Set<AnyCancellable>()
        location = .init(nil)
        isUpdatingLocation = false

        model = CrimeExplorerModel(
            dependencies: .init(
                location: location,
                startUpdatingLocation: { [weak self] in
                    guard let self else {
                        return
                    }

                    isUpdatingLocation = true
                },
                stopUpdatingLocation: { [weak self] in
                    guard let self else {
                        return
                    }

                    isUpdatingLocation = false
                }
            )
        )
    }

    override func tearDown() {
        model = nil
        isUpdatingLocation = false
        location = nil
        cancellables = nil
        super.tearDown()
    }

    func testInitSetInitialRegion() {
        let expectedRegion = MKCoordinateRegion(
            center: .london,
            span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
        )

        XCTAssertEqual(model.region, expectedRegion)
    }

    func testInitStartsUpdatingLocation() {
        XCTAssertTrue(isUpdatingLocation)
    }

    func testCurrentLocationIsInitialNil() {
        XCTAssertNil(model.currentLocation)
    }

    func testCurrentLocationWhenNewLocationIsTriggerIsUpdatedToNewLocation() {
        let expectedLocation = CLLocation(latitude: 1, longitude: 1)

        let expectation = self.expectation(description: "Location update")
        model.$currentLocation
            .filter { $0 != nil }
            .sink { location in
                XCTAssertEqual(location, expectedLocation)
                expectation.fulfill()
            }
            .store(in: &cancellables)

        location.send(expectedLocation)

        waitForExpectations(timeout: 1)
    }

}
