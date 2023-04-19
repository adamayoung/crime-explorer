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

    var body: some View {
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
