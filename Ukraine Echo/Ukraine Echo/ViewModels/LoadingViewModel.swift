//
//  LoadingViewModel.swift
//  Ukraine Echo
//
//  Created by Руслан Жидких on 11.08.2025.
//

import Foundation


final class LoadingViewModel {
    var onLoadingFinished: (() -> Void)?
    
    func startLoading() {
        // Эмуляция загрузки
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.onLoadingFinished?()
        }
    }
}
