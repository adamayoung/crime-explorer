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
        CrimeMapView(model: model)
    }

}

struct ContentView_Previews: PreviewProvider {

    static var previews: some View {
        ContentView(model: CrimeExplorerModel(dependencies: .preview))
    }

}
