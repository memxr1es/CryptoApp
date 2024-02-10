//
//  String.swift
//  CryptoApp
//
//  Created by Никита Котов on 24.09.2023.
//

import Foundation

extension String {
    var removingHTMLOccurances: String {
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression)
    }
}
