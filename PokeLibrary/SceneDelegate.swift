//
//  SceneDelegate.swift
//  PokeLibrary
//
//  Created by Shubroto Shuvo on 9/19/22.
//

import Foundation
import SwiftUI

final class SceneDelegate: NSObject, UIWindowSceneDelegate {
    
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = TabBarController(cordinator: RootCordinatorImp())
        window?.makeKeyAndVisible()
        
        for family in UIFont.familyNames {
            print(family)
            
            for names in UIFont.fontNames(forFamilyName: family){
                print("== \(names)")
            }
        }
    }
}
