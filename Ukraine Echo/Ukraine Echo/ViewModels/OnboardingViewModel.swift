//
//  OnboardingViewModel.swift
//  Ukraine Echo
//
//  Created by Руслан Жидких on 11.08.2025.
//

import Foundation

final class OnboardingViewModel {

    // MARK: - Data for screens

    let firstScreenTitle1 = "Ukraine"
    let firstScreenTitle2 = "War"
    let firstScreenTitle3 = "Memory"
    let firstScreenDescription = "The skin of the frame here is a match. The skin story is true."
    
    let secondScreenTitle = "War is never the \nanswer!"
    let secondScreenDescription = "This is a chronicle of pain, strength, and truth.\nCities that endured.\nLives that changed.\nStories that must be remembered."

    // MARK: - Callbacks 

    var onNextScreenRequested: (() -> Void)?
    var onFinish: (() -> Void)?


    func userTappedNextOnFirstScreen() {
        onNextScreenRequested?()
    }

    func userTappedFinish() {
        onFinish?()
    }
}
