//
// 📰 🐸
// Project: RSSchool_T9
//
// Author: Uladzislau Volchyk
// On: 23.07.21
//
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else {
            fatalError("LOL, be careful, drink some water")
        }
        
        
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = rootViewController()
        
        self.window = window
        window.makeKeyAndVisible()
    }
    
    func rootViewController() -> UIViewController {
        
        let tabBarVC = UITabBarController()
        tabBarVC.tabBar.tintColor = UIColor(rgb: 0xFF0000)
        let firstVC = UINavigationController(rootViewController: MainViewController())
        firstVC.tabBarItem = UITabBarItem(title: "Items", image: UIImage(systemName: "rectangle.grid.2x2"), tag: 0)
        let secondVC = UINavigationController(rootViewController: SettingsViewController())
        secondVC.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "gear"), tag: 0)
        
        let tabBarViewControllers = [firstVC, secondVC]
        tabBarVC.viewControllers = tabBarViewControllers
        tabBarVC.customizableViewControllers = nil
        tabBarVC.tabBar.barTintColor = .white
        
        return tabBarVC
    }

   


}

