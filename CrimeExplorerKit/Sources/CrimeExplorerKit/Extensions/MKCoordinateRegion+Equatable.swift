//
//  MKCoordinateRegion+Equatable.swift
//  CrimeExplorer
//
//  Created by Adam Young on 19/04/2023.
//

import Foundation
import MapKit

extension MKCoordinateRegion: Equatable {

    public static func == (lhs: MKCoordinateRegion, rhs: MKCoordinateRegion) -> Bool {
        lhs.center.latitude == rhs.center.latitude
        && lhs.center.longitude == rhs.center.longitude
        && lhs.span.latitudeDelta == rhs.span.latitudeDelta
        && lhs.span.longitudeDelta == rhs.span.longitudeDelta
    }

}
