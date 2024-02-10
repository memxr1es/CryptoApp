//
//  CoinDataService.swift
//  CryptoApp
//
//  Created by Никита Котов on 21.09.2023.
//

import Foundation
import Combine

class CoinDataService {
    @Published var allCoins: [CoinModel] = []
    
    var coinSubscription: AnyCancellable?
    let locale = NSLocale.preferredLanguages.first
    
    init() {
        getCoins()
    }
    
    func getCoins() {
        
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=rub&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h&locale=ru")
        else { return }
        
        
        coinSubscription = NetworkingManager.download(url: url)
            .decode(type: [CoinModel].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: NetworkingManager.handleCompletion) { [weak self] returnedValue in
                self?.allCoins = returnedValue
                self?.coinSubscription?.cancel() // because we call an API once
            }
    }
}
