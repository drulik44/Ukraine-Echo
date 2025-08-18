//
//  SecondOnboardingViewController.swift
//  Ukraine Echo
//
//  Created by Руслан Жидких on 12.08.2025.
//

import UIKit
import SnapKit

class SecondOnboardingViewController: UIViewController {
    private let viewModel: OnboardingViewModel
    
    init(viewModel: OnboardingViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConsraints()
        setupBindings()
        
    }
    
    //MARK: - UI Elements
    
    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "onboarding 2"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 40, weight: .bold)
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .thin)
        label.textColor = AppColors.blue
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    private let ukraineImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "ukraine flag"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let stopInvasionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .bold)
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 0
        label.text = "Stop invasion"
        return label
    }()
    
    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "Vector"), for: .normal)
        button.tintColor = .black
        button.layer.cornerRadius = 25
        button.backgroundColor = .white
        return button
    }()
    
    //MARK: - Setup Views
    private func setupViews() {
        view.addSubview(backgroundImageView)
        view.addSubview(titleLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(ukraineImageView)
        view.addSubview(stopInvasionLabel)
        view.addSubview(nextButton)
    }
    
    //MARK: - Setup constraints
    
    private func setupConsraints() {
        backgroundImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(70)
            make.left.equalToSuperview().offset(30)
            make.right.equalToSuperview().offset(-30)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(30)
            make.right.equalToSuperview().offset(-5)
            make.bottom.equalToSuperview().offset(-165)
            
        }
        ukraineImageView.snp.makeConstraints { make in
            make.width.equalTo(20)
            make.height.equalTo(20)
            make.left.equalToSuperview().offset(30)
            make.bottom.equalToSuperview().offset(-50)
        }
        stopInvasionLabel.snp.makeConstraints { make in
            make.left.equalTo(ukraineImageView.snp.right).offset(5)
            make.top.equalTo(ukraineImageView)
        }
        
        nextButton.snp.makeConstraints { make in
            make.width.equalTo(50)
            make.height.equalTo(50)
            make.right.equalToSuperview().offset(-30)
            make.bottom.equalToSuperview().offset(-35)
        }
        
        
        
    }
    private func setupBindings() {
        titleLabel.text = viewModel.secondScreenTitle
        descriptionLabel.text = viewModel.secondScreenDescription
           
           nextButton.addTarget(self, action: #selector(continueTapped), for: .touchUpInside)
        
       }
    

    
    @objc private func continueTapped() {
           viewModel.userTappedFinish()
       }
    

}
