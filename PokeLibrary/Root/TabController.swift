//
//  TabController.swift
//  PokeLibrary
//
//  Created by Shubroto Shuvo on 9/9/22.
//

import Foundation
import UIKit

class TabBarController: UITabBarController {
    private let cordinator: RootCordinator
    
    init(cordinator: RootCordinator) {
        self.cordinator = cordinator
        super.init(nibName: nil, bundle: nil)
        
        createTabs()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createTabs() {
        
        let homeViewNavController = cordinator.homeCordinator.getWithRoute()!
        homeViewNavController.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 0)
        
        let categoryNavViewController = cordinator.categoryCordinator.getWithRoute()!
        categoryNavViewController.tabBarItem = UITabBarItem(title: "Category", image: UIImage(systemName: "circle.grid.3x3"), tag: 1)
        
        self.viewControllers = [homeViewNavController, categoryNavViewController]
    }
}
