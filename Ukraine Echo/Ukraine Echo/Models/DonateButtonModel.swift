//
//  DonateButtonModel.swift
//  Ukraine Echo
//
//  Created by Руслан Жидких on 20.08.2025.
//

import UIKit

struct DonateButtonModel {
    let title: String
    let url: URL
    let style: DonateButtonStyle
}

enum DonateButtonStyle {
    case normal
    case highlighted
}
