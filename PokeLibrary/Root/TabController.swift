//
//  TabController.swift
//  PokeLibrary
//
//  Created by Shubroto Shuvo on 9/9/22.
//

import Foundation
import SwiftUI

class TabController: ObservableObject {
    @Published var activeTab: Tab = .home
    
    func open(_ tab: Tab) {
        activeTab = tab
    }
}

public enum Tab {
    case home, category, user
}
