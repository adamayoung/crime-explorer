//
//  CrimeMapView.swift
//  CrimeExplorer
//
//  Created by Adam Young on 19/04/2023.
//

import CrimeExplorerKit
import MapKit
import SwiftUI

struct CrimeMapView: View {

    @Binding var region: MKCoordinateRegion
    @State private var userTrackingMode: MapUserTrackingMode = .follow
    @State private var hasSetUserLocation = false

    var body: some View {
        ZStack {
            Map(
                coordinateRegion: $region,
                interactionModes: .all,
                showsUserLocation: true,
                userTrackingMode: $userTrackingMode
            )
        }
    }

}

struct CrimeMapView_Previews: PreviewProvider {

    struct Preview: View {

        @StateObject private var model = CrimeExplorerModel(dependencies: .preview)

        var body: some View {
            CrimeMapView(region: $model.region)
        }

    }

    static var previews: some View {
        Preview()
    }

}
