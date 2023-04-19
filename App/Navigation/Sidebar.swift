//
//  Sidebar.swift
//  CrimeExplorer
//
//  Created by Adam Young on 19/04/2023.
//

import SwiftUI

struct Sidebar: View {

    var body: some View {
        List {

        }
        #if os(macOS)
        .navigationSplitViewColumnWidth(min: 200, ideal: 200)
        #endif
    }

}

struct Sidebar_Previews: PreviewProvider {

    static var previews: some View {
        Sidebar()
    }

}
