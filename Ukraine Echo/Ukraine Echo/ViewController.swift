//
//  ViewController.swift
//  Ukraine Echo
//
//  Created by Руслан Жидких on 21.07.2025.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = AppColors.backgroundColor
        setupUI()
    }

    //MARK: - UI
    
    private let label: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 32, weight: .bold)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.text = "Привіт Україно!"
        return label
    }()

    private func setupUI() {
        view.addSubview(label)
        setupConstraints()
    }
    
    private func setupConstraints() {
        label.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(40)
        }
    }
    
}

