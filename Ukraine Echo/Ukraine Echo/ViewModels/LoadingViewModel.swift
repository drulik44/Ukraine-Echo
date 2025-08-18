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
    
    var onProgressUpdate: ((Float) -> Void)?
    var onLoadingFinished: (() -> Void)?
    
    // MARK: - Private Properties
    
    private var timer: Timer?
    private var currentProgress: Float = 0.0
    
    // MARK: - Public Methods
    
    func startLoading() {
        self.currentProgress = 0.0
        self.onProgressUpdate?(self.currentProgress)

        timer = Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { [weak self] timer in
            guard let self = self else {
                timer.invalidate()
                return
            }
            
            self.currentProgress += 0.01
            
            self.onProgressUpdate?(self.currentProgress)
            
            if self.currentProgress >= 1.0 {
                timer.invalidate()
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    self.onLoadingFinished?()
                }
            }
        }
    }
    
    // MARK: - Lifecycle
    
    deinit {
        timer?.invalidate()
    }
}
