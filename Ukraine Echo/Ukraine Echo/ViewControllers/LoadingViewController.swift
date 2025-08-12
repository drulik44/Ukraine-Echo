//
//  LoadingViewController.swift
//  Ukraine Echo
//
//  Created by Руслан Жидких on 11.08.2025.
//

import UIKit
import SnapKit

class LoadingViewController: UIViewController {
    private let viewModel: LoadingViewModel
    private var emblemImageViews: [UIImageView] = []
    
    // MARK: - Init
    init(viewModel: LoadingViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        setupEmblems()
        setupConstraints()
        bindViewModel()
        
        // Запускаем исчезновение гербов через 2 секунды
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.animateEmblems()
        }
    }
    
    // MARK: - UI Elements
    private let trizubImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "Trizub white"))
        image.contentMode = .scaleAspectFit
        image.alpha = 0.0
        return image
    }()

    var progressView: UIProgressView = {
        let progressView = UIProgressView()
        progressView.trackTintColor = .gray
        progressView.progressTintColor = .white
        progressView.alpha = 0.0
        progressView.clipsToBounds = true
        progressView.layer.cornerRadius = 8
        return progressView
    }()
    
    // MARK: - Setup UI
    private func setupEmblems() {
        for _ in 0..<5 {
            let imageView = UIImageView(image: UIImage(named: "Trizub gray"))
            imageView.contentMode = .scaleAspectFit
            view.addSubview(imageView)
            emblemImageViews.append(imageView)
        }
        
        // центральный
        emblemImageViews[0].snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.width.equalTo(278)
            make.height.equalTo(400)
            make.centerX.equalToSuperview()
        }
        
        emblemImageViews[1].snp.makeConstraints { make in
            make.right.equalTo(emblemImageViews[0].snp.left).offset(-5)
            make.bottom.equalTo(emblemImageViews[0].snp.bottom).offset(230)
            make.width.equalTo(278)
            make.height.equalTo(400)
        }
        
        emblemImageViews[2].snp.makeConstraints { make in
            make.left.equalTo(emblemImageViews[0].snp.right).offset(5)
            make.width.equalTo(278)
            make.height.equalTo(400)
            make.top.equalTo(emblemImageViews[0].snp.top).offset(230)
        }
        
        // нижний правый
        emblemImageViews[3].snp.makeConstraints { make in
            make.width.equalTo(278)
            make.height.equalTo(400)
            make.right.equalTo(emblemImageViews[0].snp.left).offset(-5)
            make.top.equalTo(emblemImageViews[0].snp.top).offset(-230)
        }
        
        // верхний правый
        emblemImageViews[4].snp.makeConstraints { make in
            make.width.equalTo(278)
            make.height.equalTo(400)
            make.left.equalTo(emblemImageViews[0].snp.right).offset(5)
            make.top.equalTo(emblemImageViews[0].snp.top).offset(-230)
        }
    }
    
    private func setupConstraints(){
        view.addSubview(trizubImage)
        view.addSubview(progressView)
        
        trizubImage.snp.makeConstraints { make in
            make.width.equalTo(278)
            make.height.equalTo(400)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        progressView.snp.makeConstraints { make in
            make.height.equalTo(15)
            make.width.equalTo(278)
            make.top.equalTo(trizubImage.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
    }
    
    // MARK: - Animations
    private func animateEmblems() {
        guard emblemImageViews.count == 5 else { return }
        
        UIView.animate(withDuration: 1.5, animations: {
            self.emblemImageViews[0].alpha = 0
            self.emblemImageViews[1].transform = CGAffineTransform(translationX: 150, y: 0)
            self.emblemImageViews[1].alpha = 0
            self.emblemImageViews[2].transform = CGAffineTransform(translationX: 150, y: 0)
            self.emblemImageViews[2].alpha = 0
            self.emblemImageViews[3].transform = CGAffineTransform(translationX: -150, y: 0)
            self.emblemImageViews[3].alpha = 0
            self.emblemImageViews[4].transform = CGAffineTransform(translationX: -150, y: 0)
            self.emblemImageViews[4].alpha = 0
        }, completion: { _ in
            self.emblemImageViews.forEach { $0.removeFromSuperview() }
            self.animateLoadingFinished()
        })
    }
    
    private func animateLoadingFinished() {
        UIView.animate(withDuration: 1) {
            self.trizubImage.alpha = 1
        }
        
        UIView.animate(withDuration: 1, delay: 1.5) {
            self.progressView.alpha = 1
        }
        viewModel.startLoading()
    }
    
    // MARK: - ViewModel Binding
    private func bindViewModel() {
        viewModel.onProgressUpdate = { [weak self] progress in
            self?.progressView.setProgress(progress, animated: true)
        }
    }
}
