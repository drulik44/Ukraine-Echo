//
//  MainTabBarViewModel.swift
//  Ukraine Echo
//
//  Created by Руслан Жидких on 20.08.2025.
//

import UIKit

final class MainTabBarViewModel {
    
    let tabs: [TabItem]
    
    private(set) var selectedIndex: Int = 0 {
        didSet {
            onTabSelected?(selectedIndex)
        }
    }
    
    var onTabSelected: ((Int) -> Void)?
    
    init() {
        tabs = [
            TabItem(title: "Map",
                    icon: "map",
                    viewController: UINavigationController(rootViewController: MapViewController()),
                    tag: 0),
            
            TabItem(title: "News",
                    icon: "News",
                    viewController: UINavigationController(rootViewController: NewsViewController()),
                    tag: 1),
            
            TabItem(title: "Donate",
                    icon: "Donate",
                    viewController: UINavigationController(rootViewController: DonateViewController()),
                    tag: 2),
            
            TabItem(title: "Heroes",
                    icon: "heroes",
                    viewController: UINavigationController(rootViewController: HeroesViewController()),
                    tag: 3)
        ]
    }
    
    func selectTab(index: Int) {
        selectedIndex = index
    }
}
