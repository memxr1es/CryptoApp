//
//  StatisticModel.swift
//  CryptoApp
//
//  Created by Никита Котов on 21.09.2023.
//

import Foundation

struct StatisticModel: Identifiable {
    let id = UUID().uuidString
    let title: String
    let value: String
    let percantageChange: Double?
    
    init(title: String, value: String, percantageChange: Double? = nil) {
        self.title = title
        self.value = value
        self.percantageChange = percantageChange
    }
}
