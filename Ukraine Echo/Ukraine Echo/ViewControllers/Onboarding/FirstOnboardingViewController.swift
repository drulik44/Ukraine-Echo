//
//  FirstOnboardingViewController.swift
//  Ukraine Echo
//
//  Created by Руслан Жидких on 12.08.2025.
//

import UIKit
import SnapKit

class FirstOnboardingViewController: UIViewController {
    var onNext: (() -> Void)?
    private let viewModel: OnboardingViewModel

        init(viewModel: OnboardingViewModel) {
            self.viewModel = viewModel
            super.init(nibName: nil, bundle: nil)
        }

    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
        setupBindings()
        
    }
    
   
    
    //MARK: - UI ELEMENT
    
    private let heartImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Heart")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let helperButton: UIButton = {
        let btw = UIButton(type: .custom)
        let image = UIImage(named: "HELPER")
        btw.setImage(image, for: .normal)
        
        return btw
    }()
    
    private let infoButton: UIButton = {
        let btw = UIButton(type: .custom)
        let image = UIImage(named: "INFO")
        btw.setImage(image, for: .normal)
        return btw
    }()
    
    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "background onboarding1")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let titleLabel1: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 80, weight: .bold)
        label.textColor = .black
        label.textAlignment = .left
        label.numberOfLines = 1
        return label
    }()
    
    private let titleLabel2: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 80, weight: .bold)
        label.textColor = .black
        label.textAlignment = .left
        label.numberOfLines = 1
        return label
    }()
    
    
    private let titleLabel3: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 75, weight: .bold)
        label.textColor = .black
        label.textAlignment = .left
        label.numberOfLines = 1
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 25, weight: .thin)
        label.textColor = AppColors.descriptionTextColor
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    private let nextButton: UIButton = {
        let btw = UIButton(type: .system)
        btw.setTitle("Witness the truth", for: .normal)
        btw.titleLabel?.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        btw.setTitleColor(AppColors.onboardingButtonTextColor, for: .normal)
        btw.backgroundColor = AppColors.yellow
        btw.layer.cornerRadius = 30
        btw.layer.masksToBounds = true
        return btw
    }()
    
    //MARK: - Setup View
    
    private func setupView() {
        view.addSubview(backgroundImageView)
        view.addSubview(heartImageView)
        view.addSubview(helperButton)
        
        view.addSubview(titleLabel1)
        view.addSubview(titleLabel2)
        view.addSubview(titleLabel3)
        view.addSubview(descriptionLabel)
        view.addSubview(nextButton)
        view.addSubview(heartImageView)
        
        view.addSubview(infoButton)
        
        
    }
    
    //MARK: - Setup Constraints
    
    private func setupConstraints() {
        
        heartImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(5)
            make.left.equalToSuperview().offset(30)
            make.height.equalTo(27)
            make.width.equalTo(27)
        }
        
        helperButton.snp.makeConstraints { make in
            make.width.equalTo(91)
            make.height.equalTo(25)
            make.left.equalTo(heartImageView.snp.right).offset(10)
            make.top.equalTo(heartImageView.snp.top)
        }
        
        infoButton.snp.makeConstraints { make in
            make.width.equalTo(25)
            make.height.equalTo(25)
            make.right.equalToSuperview().offset(-30)
            make.top.equalTo(heartImageView.snp.top)
        }
        
        backgroundImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        titleLabel1.snp.makeConstraints { make in
            make.height.equalTo(85)
            make.left.equalToSuperview().offset(30)
            make.right.equalToSuperview().offset(-60)
            make.top.equalToSuperview().offset(200)
        }
        titleLabel2.snp.makeConstraints { make in
            make.height.equalTo(85)
            make.left.equalToSuperview().offset(30)
            make.right.equalToSuperview().offset(-60)
            make.top.equalTo(titleLabel1.snp.bottom).offset(2)
        }
        titleLabel3.snp.makeConstraints { make in
            make.height.equalTo(90)
            make.left.equalToSuperview().offset(30)
            make.right.equalToSuperview().offset(-60)
            make.top.equalTo(titleLabel2.snp.bottom).offset(2)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel3.snp.bottom).offset(40)
            make.left.equalToSuperview().offset(30)
            make.right.equalToSuperview().offset(-60)
        }
        
        nextButton.snp.makeConstraints { make in
            make.height.equalTo(60)
            make.left.equalToSuperview().offset(30)
            make.right.equalToSuperview().offset(-30)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-55)
        }
        
    }
    
    private func setupBindings() {
           titleLabel1.text = viewModel.firstScreenTitle1
           titleLabel2.text = viewModel.firstScreenTitle2
           titleLabel3.text = viewModel.firstScreenTitle3
           descriptionLabel.text = viewModel.firstScreenDescription

           // Назначаем действия кнопкам
           nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        helperButton.addTarget(self, action: #selector(openHelper), for: .touchUpInside)
        infoButton.addTarget(self, action: #selector(openInfo), for: .touchUpInside)
       }
    
    @objc private func openHelper(){
        if let url = URL(string: "https://u24.gov.ua/") {
            UIApplication.shared.open(url)
        }
    }
    @objc private func openInfo() {
        if let url = URL(string:"https://en.wikipedia.org/wiki/Russo-Ukrainian_War"){
            UIApplication.shared.open(url)
        }
    }
    @objc private func nextButtonTapped() {
           viewModel.userTappedNextOnFirstScreen()
       }
    
    
    
}
