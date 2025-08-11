//
//  OnboardingCoordinator.swift
//  Ukraine Echo
//
//  Created by Руслан Жидких on 11.08.2025.
//

import UIKit

final class OnboardingCoordinator: BaseCoordinator {
    var onFinish: (() -> Void)?
    
    override func start() {
        let vm = OnboardingViewModel()
        let vc = OnboardingViewController(viewModel: vm)
        vm.onFinish = { [weak self] in
            self?.onFinish?()
        }
        navigationController.setViewControllers([vc], animated: true)
    }
}
