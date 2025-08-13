//
//  OnboardingViewController.swift
//  Ukraine Echo
//
//  Created by Руслан Жидких on 11.08.2025.
//


import UIKit

final class OnboardingViewController: UIPageViewController, UIPageViewControllerDelegate {

    private let viewModel: OnboardingViewModel

    private lazy var firstVC = FirstOnboardingViewController(viewModel: viewModel)
    private lazy var secondVC = SecondOnboardingViewController(viewModel: viewModel)

    private lazy var pages: [UIViewController] = [firstVC, secondVC]

    init(viewModel: OnboardingViewModel) {
        self.viewModel = viewModel
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        self.delegate = self
        self.dataSource = nil // чтобы свайп был отключен, как в твоём коде
        setupBindings()
    }

    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    override func viewDidLoad() {
        super.viewDidLoad()
        setViewControllers([firstVC], direction: .forward, animated: true)
    }

    private func setupBindings() {
        viewModel.onNextScreenRequested = { [weak self] in
            self?.goToSecondPage()
        }
        viewModel.onFinish = { [weak self] in
            // Например, закрыть onboarding
            self?.dismiss(animated: true)
        }
    }

    private func goToSecondPage() {
        setViewControllers([secondVC], direction: .forward, animated: true)
    }
}

