//
//  UIApplication.swift
//  CryptoApp
//
//  Created by Никита Котов on 21.09.2023.
//

import Foundation
import SwiftUI

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
