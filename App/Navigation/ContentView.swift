//
//  ContentView.swift
//  CrimeExplorer
//
//  Created by Adam Young on 18/04/2023.
//

import CrimeExplorerKit
import SwiftUI

struct ContentView: View {

    @ObservedObject var model: CrimeExplorerModel

    @Environment(\.colorScheme) private var colorScheme

    #if os(macOS)
    private var neighbourhoodName: String {
        model.currentNeighbourhood?.name ?? NSLocalizedString("CRIME_EXPLORER", comment: "Crime Explorer")
    }
    #endif

    #if os(iOS)
    private var neighbourhoodName: String {
        model.currentNeighbourhood?.name ?? ""
    }
    #endif

    var body: some View {
        #if os(macOS)
        NavigationSplitView {
            Sidebar()
        } detail: {
            crimeMap
                .navigationTitle(neighbourhoodName)
        }
        .frame(minWidth: 600, minHeight: 450)
        #else
        ZStack(alignment: .top) {
            crimeMap
                .ignoresSafeArea()

            Text(verbatim: neighbourhoodName)
                .font(.headline).bold()
                .multilineTextAlignment(.center)
                .padding(.horizontal)
                .padding(.top)
                .shadow(
                    color: (colorScheme == .dark ? .black.opacity(0.5) : .white.opacity(0.5)),
                    radius: 2,
                    x: 0,
                    y: 0
                )
        }
        #endif
    }

    private var crimeMap: some View {
        CrimeMapView(region: $model.region)
    }

}

struct ContentView_Previews: PreviewProvider {

    struct Preview: View {

        @StateObject private var model = CrimeExplorerModel(dependencies: .preview)

        var body: some View {
            ContentView(model: model)
        }

    }

    static var previews: some View {
        Preview()
    }

}
