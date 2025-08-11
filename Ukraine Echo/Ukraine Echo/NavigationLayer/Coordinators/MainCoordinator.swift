//
//  MainCoordinator.swift
//  Ukraine Echo
//
//  Created by Руслан Жидких on 11.08.2025.
//

import UIKit

final class MainCoordinator: BaseCoordinator {
    override func start() {
        let tabBar = MainTabBarController()
        navigationController.setViewControllers([tabBar], animated: true)
    }
}
