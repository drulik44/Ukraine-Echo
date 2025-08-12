//
//  AppCoordinator.swift
//  Ukraine Echo
//
//  Created by Руслан Жидких on 11.08.2025.
//

import UIKit

final class AppCoordinator: BaseCoordinator {
    override func start() {
        showLoading()
    }
    
    private func showLoading() {
        let vm = LoadingViewModel()
        let vc = LoadingViewController(viewModel: vm)
        
        vm.onLoadingFinished = { [weak self] in
            self?.decideStartFlow()
        }
        
        navigationController.setViewControllers([vc], animated: false)
    }
    
    private func decideStartFlow() {
        let firstLaunch = !UserDefaults.standard.bool(forKey: "hasSeenOnboarding")
        
        if firstLaunch {
            showOnboarding()
        } else {
            showMain()
        }
    }
    
    private func showOnboarding() {
        let onboardingCoordinator = OnboardingCoordinator(navigationController: navigationController)
        onboardingCoordinator.onFinish = { [weak self, weak onboardingCoordinator] in
            if let coordinator = onboardingCoordinator {
                self?.childCoordinators.removeAll { $0 === coordinator }
            }
            UserDefaults.standard.set(true, forKey: "hasSeenOnboarding")
            self?.showMain()
        }
        childCoordinators.append(onboardingCoordinator)
        onboardingCoordinator.start()
    }
    
    private func showMain() {
        let mainCoordinator = MainCoordinator(navigationController: navigationController)
        childCoordinators.append(mainCoordinator)
        mainCoordinator.start()
    }
}
