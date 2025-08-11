//
//  OnboardingViewController.swift
//  Ukraine Echo
//
//  Created by Руслан Жидких on 11.08.2025.
//


import UIKit

final class OnboardingViewController: UIViewController {
    private let viewModel: OnboardingViewModel
    
    init(viewModel: OnboardingViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        
        let label = UILabel()
        label.text = "Онбординг - Свайпай!"
        label.textColor = .white
        label.font = .systemFont(ofSize: 22, weight: .medium)
        label.textAlignment = .center
        
        let button = UIButton(type: .system)
        button.setTitle("Начать", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 20)
        button.addTarget(self, action: #selector(finishTapped), for: .touchUpInside)
        
        let stack = UIStackView(arrangedSubviews: [label, button])
        stack.axis = .vertical
        stack.spacing = 20
        stack.alignment = .center
        
        view.addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stack.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc private func finishTapped() {
        viewModel.onFinish?()
    }
}
