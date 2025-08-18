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
        
        let mapVC = UINavigationController(rootViewController: MapViewController())
        //mapVC.topViewController?.view.backgroundColor = AppColors.backgroundColor
        mapVC.tabBarItem = UITabBarItem(title: "Map", image: UIImage(systemName: "map"), tag: 0)
        
        let newsVC = UINavigationController(rootViewController: NewsViewController())
        newsVC.topViewController?.view.backgroundColor = .red
        newsVC.tabBarItem = UITabBarItem(title: "News", image: UIImage(systemName: "newspaper"), tag: 1)
        
        let donateVC = UINavigationController(rootViewController: DonateViewController())
        donateVC.topViewController?.view.backgroundColor = .white
        donateVC.tabBarItem = UITabBarItem(title: "Donate", image: UIImage(systemName: "heart"), tag: 2)
        
        let heroesVC = UINavigationController(rootViewController: HeroesViewController())
        heroesVC.topViewController?.view.backgroundColor = .blue
        heroesVC.tabBarItem = UITabBarItem(title: "Heroes", image: UIImage(systemName: "star"), tag: 3)
        
        viewControllers = [mapVC, newsVC, donateVC, heroesVC]
        view.addSubview(customBar)
        tabBar.isHidden = true
        buttonMap.tintColor = AppColors.accentBlue

        
    }
    
    private lazy  var customBar: UIStackView = {
        $0.axis = .horizontal
        $0.distribution = .fillEqually
        $0.alignment = .center
        $0.backgroundColor = AppColors.tabBarBackgroundColor
        $0.frame = CGRect(x: 30, y: view.frame.height - 120 , width: view.frame.width - 60, height: 77)
        $0.layer.cornerRadius = 15
        $0.layer.borderWidth = 1.0
        $0.layer.borderColor = AppColors.blue.cgColor
    
       

        $0.addArrangedSubview(buttonMap)
        $0.addArrangedSubview(buttonNews)
        $0.addArrangedSubview(buttonDonate)
        $0.addArrangedSubview(buttonHeroes)
        
        
        return $0
    }(UIStackView())
    
    private func getButton(icon: String, tag: Int, action:UIAction ) -> UIButton {
        return{
            $0.setImage(UIImage(named: icon), for: .normal)
            $0.tag = tag
            $0.tintColor = AppColors.gray
            return $0
        }(UIButton(primaryAction: action))
    }
    
    private lazy var buttonMap = getButton(icon: "map", tag: 0, action: action)
    private lazy var buttonNews = getButton(icon: "News", tag: 1, action: action)
    private lazy var buttonDonate = getButton(icon: "Donate", tag: 2, action: action)
    private lazy var buttonHeroes = getButton(icon: "heroes", tag: 3, action: action)
    
    
    lazy var action = UIAction {[weak self] sender in
        guard let sender = sender.sender as? UIButton,
              let self = self else { return }
        
        self.selectedIndex = sender.tag
        self.setColor(tag: sender.tag)
    }
    
    private func setColor(tag: Int){
        [buttonMap, buttonNews, buttonDonate,buttonHeroes].forEach { btn in
            if btn.tag != tag {
                btn.tintColor = AppColors.tabBarButtonColor
            }else {
                btn.tintColor = AppColors.accentBlue
            }
            
        }
    }
}
