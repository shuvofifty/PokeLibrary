//
//  RootView.swift
//  PokeLibrary
//
//  Created by Shubroto Shuvo on 9/9/22.
//

import Foundation
import SwiftUI

struct RootView: View {
    @StateObject private var tabController = TabController()
    
    var body: some View {
        TabView(selection: $tabController.activeTab) {
            HomeView()
                .tag(Tab.home)
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            EmptyView()
                .tag(Tab.category)
                .tabItem {
                    Label("Category", systemImage: "circle.grid.3x3")
                }
            EmptyView()
                .tag(Tab.user)
                .tabItem {
                    Label("User", systemImage: "person")
                }
        }
        .environmentObject(tabController)
    }
}