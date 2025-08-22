//
//  DonateViewController.swift
//  Ukraine Echo
//
//  Created by Руслан Жидких on 18.08.2025.
//

import UIKit
import SnapKit

class DonateViewController: UIViewController {
    

    private let viewModel = DonationViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
        setupButtons()
        additionalSafeAreaInsets = .zero
        


        
    }
  
    //MARK: - UI
    
    private let heartView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "Heart"))
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = AppColors.blue
        return imageView
    }()
    
    private let helperView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "HELPER"))
        imageView.tintColor = AppColors.blue
        imageView.contentMode = .scaleAspectFit

        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 35, weight: .black)
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    private let stack = UIStackView()

    
    //MARK: - Setup View
    
    private func setupView() {
        view.backgroundColor = AppColors.backgroundColor
        view.addSubview(heartView)
        view.addSubview(helperView)
        view.addSubview(titleLabel)
        titleLabel.text = viewModel.donationTitle
        stack.axis = .vertical
        stack.spacing = 16
        stack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stack)
        
        
    }
    
    //MARK: - SETUP CONSTRAINTS
    
    private func setupConstraints() {
        heartView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(30)
            make.top.equalToSuperview().inset(80)
        }
        helperView.snp.makeConstraints { make in
            make.width.equalTo(91)
            make.height.equalTo(44)
            make.left.equalTo(heartView.snp.right).offset(10)
            make.centerY.equalTo(heartView.snp.centerY)

        }
        titleLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(30)
            make.right.equalToSuperview().offset(-30)
            make.top.equalToSuperview().offset(125)
            make.height.equalTo(85)

            
        }
        
        stack.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(35)
            make.left.equalToSuperview().offset(30)
            make.right.equalToSuperview().offset(-30)
        }
       


    }
    
    private func setupButtons() {
           for (index, model) in viewModel.buttons.enumerated() {
               let button = UIButton(type: .system)
               button.setTitle(model.title, for: .normal)
               button.tag = index
               button.addTarget(self, action: #selector(handleTap(_:)), for: .touchUpInside)
               button.snp.makeConstraints { make in
                   make.height.equalTo(70)
               }
               
               switch model.style {
               
               case .highlighted:
                   button.backgroundColor = AppColors.yellow
                   button.setTitleColor(AppColors.accentBlue, for: .normal)
                   button.layer.cornerRadius = 33
                   button.layer.borderWidth = 1
                   button.layer.borderColor = AppColors.blue.cgColor
                   button.titleLabel?.font = UIFont.systemFont(ofSize: 23, weight: .bold)
               case .normal:
                   button.backgroundColor = AppColors.backgroundColor
                   button.setTitleColor(.white, for: .normal)
                   button.layer.cornerRadius = 33
                   button.layer.borderWidth = 1
                   button.layer.borderColor = AppColors.blue.cgColor
                   button.titleLabel?.font = UIFont.systemFont(ofSize: 23, weight: .bold)
               }
               
               stack.addArrangedSubview(button)
           }
       }
       
       @objc private func handleTap(_ sender: UIButton) {
           viewModel.didTapButton(at: sender.tag)
       }
    
    
    }
  

