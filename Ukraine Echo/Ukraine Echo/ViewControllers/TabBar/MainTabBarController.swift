//
//  MainTabBarController.swift
//  Ukraine Echo
//
//  Created by Руслан Жидких on 11.08.2025.
//

import UIKit

final class MainTabBarController: UITabBarController {
    
    private let viewModel: MainTabBarViewModel
    
    init(viewModel: MainTabBarViewModel = MainTabBarViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: UI
    private lazy var customBar: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.alignment = .center
        stack.backgroundColor = AppColors.tabBarBackgroundColor
        stack.frame = CGRect(x: 30, y: view.frame.height - 120 , width: view.frame.width - 60, height: 77)
        stack.layer.cornerRadius = 15
        stack.layer.borderWidth = 1.0
        stack.layer.borderColor = AppColors.blue.cgColor
        return stack
    }()
    
    private var buttons: [UIButton] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 1. Устанавливаем контроллеры из ViewModel
        self.viewControllers = viewModel.tabs.map { $0.viewController }
        tabBar.isHidden = true
        
        // 2. Создаем кастомные кнопки
        setupButtons()
        view.addSubview(customBar)
        
        // 3. Подписка на изменение selectedIndex
        viewModel.onTabSelected = { [weak self] index in
            self?.selectedIndex = index
            self?.updateButtonColors(selectedIndex: index)
        }
        
        // 4. Выбираем первую вкладку
        viewModel.selectTab(index: 0)
    }
    
    private func setupButtons() {
        buttons = viewModel.tabs.map { tab in
            let action = UIAction { [weak self] _ in
                self?.viewModel.selectTab(index: tab.tag)
            }
            let button = UIButton(primaryAction: action)
            button.setImage(UIImage(named: tab.icon), for: .normal)
            button.tag = tab.tag
            button.tintColor = AppColors.tabBarButtonColor
            customBar.addArrangedSubview(button)
            return button
        }
    }
    
    private func updateButtonColors(selectedIndex: Int) {
        buttons.forEach { button in
            button.tintColor = (button.tag == selectedIndex) ? AppColors.accentBlue : AppColors.tabBarButtonColor
        }
    }
}
