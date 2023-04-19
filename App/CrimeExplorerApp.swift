//
//  CrimeExplorerApp.swift
//  CrimeExplorer
//
//  Created by Adam Young on 18/04/2023.
//

import CrimeExplorerKit
import SwiftUI

@main
struct CrimeExplorerApp: App {

    @StateObject private var model = CrimeExplorerModel(dependencies: .live)

    var body: some Scene {
        WindowGroup {
            ContentView(model: model)
        }
    }

}
