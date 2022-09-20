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
        let cordinator = Cordinator()
        let navController = UINavigationController(rootViewController: TabBarController(cordinator: cordinator))
        window?.rootViewController = navController
        cordinator.router = RouterImp(navigationController: navController)
        window?.makeKeyAndVisible()
    }
}
