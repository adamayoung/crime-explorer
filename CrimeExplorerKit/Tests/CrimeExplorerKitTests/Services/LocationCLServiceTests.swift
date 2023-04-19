import Combine
import CoreLocation
@testable import CrimeExplorerKit
import XCTest

final class LocationCLServiceTests: XCTestCase {

    var locationService: LocationCLService!
    var locationManager: CLLocationManagerMock!
    var cancellables: Set<AnyCancellable>!

    override func setUp() {
        super.setUp()
        locationManager = CLLocationManagerMock()
        locationService = LocationCLService(locationManager: locationManager)
        cancellables = Set<AnyCancellable>()
    }

    override func tearDown() {
        cancellables = nil
        locationService = nil
        locationManager = nil
        super.tearDown()
    }

    func testLocationManagerDesiredAccurarcySetToBest() {
        XCTAssertEqual(locationManager.desiredAccuracy, kCLLocationAccuracyBest)
    }

    func testLocationManagerDistanceFilterSetToNone() {
        XCTAssertEqual(locationManager.distanceFilter, kCLDistanceFilterNone)
    }

    func testLocationManagerDelegate() {
        XCTAssertNotNil(locationManager.delegate)
    }

    func testLocationIsInitialNil() {
        XCTAssertNil(locationService.location.value)
    }

    func testLocationWhenReceivedLocationsUpdateLocation() {
        let expectedLocation = CLLocation(latitude: 1, longitude: 1)

        locationService.locationManager(CLLocationManager(), didUpdateLocations: [expectedLocation])

        XCTAssertEqual(locationService.location.value, expectedLocation)
    }

    func testLocationsWhenReceivedNoLocationsDoesNotUpdateLocation() {
        locationService.locationManager(CLLocationManager(), didUpdateLocations: [])

        XCTAssertNil(locationService.location.value)
    }

    func testStartUpdatingRequestsWhenInUseAuthorization() {
        locationService.startUpdating()

        XCTAssertTrue(locationManager.didRequestWhenInUseAuthorisation)
    }

    func testStartUpdatingStartsUpdatingLocation() {
        locationService.startUpdating()

        XCTAssertTrue(locationManager.didStartUpdatingLocation)
    }

    func testStopUpdatingStopsUpdatingLocation() {
        locationService.stopUpdating()

        XCTAssertTrue(locationManager.didStopUpdatingLocation)
    }

}

extension LocationCLServiceTests {

    final class CLLocationManagerMock: CLLocationManaging {

        var desiredAccuracy: CLLocationAccuracy = kCLLocationAccuracyReduced
        var distanceFilter: CLLocationDistance = CLLocationDistanceMax
        var delegate: CLLocationManagerDelegate?

        private(set) var didRequestWhenInUseAuthorisation = false
        private(set) var didStartUpdatingLocation = false
        private(set) var didStopUpdatingLocation = false

        init() { }

        func requestWhenInUseAuthorization() {
            didRequestWhenInUseAuthorisation = true
        }

        func startUpdatingLocation() {
            didStartUpdatingLocation = true
        }

        func stopUpdatingLocation() {
            didStopUpdatingLocation = true
        }

    }

}
