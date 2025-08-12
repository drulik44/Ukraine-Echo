//
//  LoadingViewModel.swift
//  Ukraine Echo
//
//  Created by Руслан Жидких on 11.08.2025.
//

import Foundation
import UIKit

final class LoadingViewModel {
    
    // MARK: - Callbacks to View
    
    // Этот замыкание вызывается при каждом обновлении прогресса
    var onProgressUpdate: ((Float) -> Void)?
    // Этот замыкание вызывается по завершении загрузки
    var onLoadingFinished: (() -> Void)?
    
    // MARK: - Private Properties
    
    private var timer: Timer?
    private var currentProgress: Float = 0.0
    
    // MARK: - Public Methods
    
    func startLoading() {
        // Устанавливаем начальное значение прогресса и уведомляем View
        self.currentProgress = 0.0
        self.onProgressUpdate?(self.currentProgress)

        // Имитируем загрузку с помощью таймера
        timer = Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { [weak self] timer in
            guard let self = self else {
                timer.invalidate()
                return
            }
            
            // Увеличиваем прогресс
            self.currentProgress += 0.01
            
            // Отправляем новое значение прогресса в View
            self.onProgressUpdate?(self.currentProgress)
            
            // Когда загрузка завершена
            if self.currentProgress >= 1.0 {
                timer.invalidate()
                // Уведомляем View, что загрузка завершена
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    self.onLoadingFinished?()
                }
            }
        }
    }
    
    // MARK: - Lifecycle
    
    // Останавливаем таймер, если ViewModel будет удален из памяти
    deinit {
        timer?.invalidate()
    }
}
