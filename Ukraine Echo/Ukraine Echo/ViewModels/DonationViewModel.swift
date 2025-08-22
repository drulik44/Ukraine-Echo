//
//  DonationViewModel.swift
//  Ukraine Echo
//
//  Created by Руслан Жидких on 20.08.2025.
//

import Foundation
import UIKit

final class DonationViewModel {
    
    let donationTitle = "Select direction of donation"
    
    let buttons: [DonateButtonModel] = [
        DonateButtonModel(title: "SOCIAL HELP", url: URL(string: "https://www.razomforukraine.org/ua/donate-ua-new/")!, style: .highlighted),
        DonateButtonModel(title: "MEDICAL AID", url: URL(string: "https://www.helpinghandsukraine.org/?utm_source=chatgpt.com")!, style: .normal),
        DonateButtonModel(title: "MILITARY", url: URL(string: "https://savelife.in.ua")!, style: .normal),
        DonateButtonModel(title: "RENOVATION", url: URL(string: "https://u24.gov.ua/")!, style: .normal)
        
    ]
    
        func didTapButton(at index: Int) {
            let button = buttons[index]
            UIApplication.shared.open(button.url)
        }
}
