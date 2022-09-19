//
//  TabController.swift
//  PokeLibrary
//
//  Created by Shubroto Shuvo on 9/9/22.
//

import Foundation
import UIKit

class TabBarController: UITabBarController {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let homeViewController = HomeViewController()
        homeViewController.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 0)
        
        let categoryViewController = CategoryViewController()
        categoryViewController.tabBarItem = UITabBarItem(title: "Category", image: UIImage(systemName: "circle.grid.3x3"), tag: 1)
        
        self.viewControllers = [homeViewController, categoryViewController]
    }
}
