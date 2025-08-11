//
//  LoadingViewController.swift
//  Ukraine Echo
//
//  Created by Руслан Жидких on 11.08.2025.
//

import UIKit

 class LoadingViewController: UIViewController {
    private let viewModel: LoadingViewModel
    
    init(viewModel: LoadingViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = AppColors.backgroundColor
        
        let label = UILabel()
        label.text = "Загрузка..."
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 20)
        
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        viewModel.startLoading()
    }
}
