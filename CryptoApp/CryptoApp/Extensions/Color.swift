//
//  Color.swift
//  CryptoApp
//
//  Created by Никита Котов on 20.09.2023.
//

import Foundation
import SwiftUI

extension Color {
    static let theme = ColorTheme() // Just change ColorTheme to the required scheme (for ex. ColorTheme -> ColorTheme2)
    static let launch = LaunchTheme()
}

struct ColorTheme {
    let accent = Color("AccentColor")
    let background = Color("BackgroundColor")
    let green = Color("GreenColor")
    let red = Color("RedColor")
    let secondaryText = Color("SecondaryTextColor")
}

struct ColorTheme2 {
    let accent = Color(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1))
    let background = Color(#colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1))
    let green = Color(#colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1))
    let red = Color(#colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1))
    let secondaryText = Color(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1))
}

struct LaunchTheme {
    let accent = Color("LaunchAccentColor")
    let background = Color("LaunchBackgroundColor")
}
