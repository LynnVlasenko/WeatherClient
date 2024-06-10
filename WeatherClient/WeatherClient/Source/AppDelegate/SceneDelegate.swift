//
//  SceneDelegate.swift
//  WeatherClient
//
//  Created by Алина Власенко on 20.05.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        
        let initialVc = MainViewController()
        let navigationController = UINavigationController(rootViewController: initialVc)
            
        window.rootViewController = navigationController
    
        self.window = window
        
        window.makeKeyAndVisible()
    }
}

