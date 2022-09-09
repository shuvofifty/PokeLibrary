//
//  PokeLibraryApp.swift
//  PokeLibrary
//
//  Created by Shubroto Shuvo on 8/19/22.
//

import SwiftUI

@main
struct PokeLibraryApp: App {
    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(Cordinator())
        }
    }
}
