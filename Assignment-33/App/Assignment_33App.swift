//
//  Assignment_33App.swift
//  Assignment-33
//
//  Created by Eka Kelenjeridze on 27.12.23.
//

import SwiftUI

@main
struct Assignment_33App: App {
    @State var viewModel = NewsViewModel()
    
    var body: some Scene {
        WindowGroup {
            NewsView()
        }
        .environmentObject(viewModel)
    }
}
