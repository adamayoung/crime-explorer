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

    @ObservedObject var model: CrimeExplorerModel

    @State private var region: MKCoordinateRegion = .uk
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
        .onChange(of: model.currentLocation) { location in
            guard !hasSetUserLocation, let location else {
                return
            }

            hasSetUserLocation = true
            centerMap(to: location)
        }
        .onChange(of: region) { region in
            model.region = region
        }
        .ignoresSafeArea()
    }

    private func centerMap(to location: CLLocation) {
        region = MKCoordinateRegion(
            center: location.coordinate,
            span: MKCoordinateSpan(
                latitudeDelta: 0.01,
                longitudeDelta: 0.01
            )
        )
    }

}

struct CrimeMapView_Previews: PreviewProvider {

    struct Preview: View {

        @StateObject private var model = CrimeExplorerModel(dependencies: .preview)

        var body: some View {
            CrimeMapView(model: model)
        }

    }

    static var previews: some View {
        Preview()
    }

}
