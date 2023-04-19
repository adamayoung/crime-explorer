//
//  LocationManager.swift
//  CrimeExplorer
//
//  Created by Adam Young on 19/04/2023.
//

import Combine
import CoreLocation
import Foundation

public protocol LocationService: AnyObject {

    var location: CurrentValueSubject<CLLocation?, Never> { get }

}
