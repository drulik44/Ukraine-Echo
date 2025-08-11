//
//  MainTabBarController.swift
//  Ukraine Echo
//
//  Created by Руслан Жидких on 11.08.2025.
//

import UIKit

final class MainTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let mapVC = UINavigationController(rootViewController: UIViewController())
        mapVC.topViewController?.view.backgroundColor = AppColors.backgroundColor
        mapVC.tabBarItem = UITabBarItem(title: "Map", image: UIImage(systemName: "map"), tag: 0)
        
        let newsVC = UINavigationController(rootViewController: UIViewController())
        newsVC.topViewController?.view.backgroundColor = .red
        newsVC.tabBarItem = UITabBarItem(title: "News", image: UIImage(systemName: "newspaper"), tag: 1)
        
        let donateVC = UINavigationController(rootViewController: UIViewController())
        donateVC.topViewController?.view.backgroundColor = .white
        donateVC.tabBarItem = UITabBarItem(title: "Donate", image: UIImage(systemName: "heart"), tag: 2)
        
        let heroesVC = UINavigationController(rootViewController: UIViewController())
        heroesVC.topViewController?.view.backgroundColor = .blue
        heroesVC.tabBarItem = UITabBarItem(title: "Heroes", image: UIImage(systemName: "star"), tag: 3)
        
        viewControllers = [mapVC, newsVC, donateVC, heroesVC]
    }
}
