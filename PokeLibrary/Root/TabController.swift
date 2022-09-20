//
//  TabController.swift
//  PokeLibrary
//
//  Created by Shubroto Shuvo on 9/9/22.
//

import Foundation
import UIKit

class TabBarController: UITabBarController {
    private let cordinator: Cordinator
    
    init(cordinator: Cordinator) {
        self.cordinator = cordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let homeViewController = cordinator.createHomeViewController()
        homeViewController.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 0)
        
        let categoryViewController = cordinator.createCategoryViewController()
        categoryViewController.tabBarItem = UITabBarItem(title: "Category", image: UIImage(systemName: "circle.grid.3x3"), tag: 1)
        
        self.viewControllers = [homeViewController, categoryViewController]
    }
}
