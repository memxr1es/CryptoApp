//
//  CoinModel.swift
//  CryptoApp
//
//  Created by Никита Котов on 20.09.2023.
//

import Foundation

// CoinGecko Info
/*
    url: https://api.coingecko.com/api/v3/coins/markets?vs_currency=rub&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24&locale=ru&precision=full
 
 
 JSON Response
 
    returningData:
 {
     "id": "bitcoin",
     "symbol": "btc",
     "name": "Биткоин",
     "image": "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579",
     "current_price": 2603510.6210501716,
     "market_cap": 50780782201641,
     "market_cap_rank": 1,
     "fully_diluted_valuation": 54712318200318,
     "total_volume": 1359898291119,
     "high_24h": 2652660,
     "low_24h": 2591774,
     "price_change_24h": -16629.34245521901,
     "price_change_percentage_24h": -0.63467,
     "market_cap_change_24h": -343552598800.1328,
     "market_cap_change_percentage_24h": -0.67199,
     "circulating_supply": 19490975,
     "total_supply": 21000000,
     "max_supply": 21000000,
     "ath": 6075508,
     "ath_change_percentage": -57.16066,
     "ath_date": "2022-03-07T16:43:46.826Z",
     "atl": 2206.43,
     "atl_change_percentage": 117859.94428,
     "atl_date": "2013-07-05T00:00:00.000Z",
     "roi": null,
     "last_updated": "2023-09-20T10:21:11.125Z",
     "sparkline_in_7d": {
       "price": [
         25899.214193103733,
         25950.63889586843,
         27149.351761098074
       ]
     }
   }
 */

struct CoinModel: Identifiable, Codable {
    let id, symbol, name: String
    let image: String
    let currentPrice: Double
    let marketCap, marketCapRank, fullyDilutedValuation, totalVolume: Double?
    let high24H, low24H: Double?
    let priceChange24H, priceChangePercentage24H, marketCapChange24H, marketCapChangePercentage24H: Double?
    let circulatingSupply, totalSupply, maxSupply, ath: Double?
    let athChangePercentage: Double?
    let athDate: String?
    let atl, atlChangePercentage: Double?
    let atlDate: String?
    let lastUpdated: String?
    let sparklineIn7D: SparklineIn7D?
    let currentHoldings: Double?
    
    enum CodingKeys: String, CodingKey {
        case id, symbol, name, image
        case currentPrice = "current_price"
        case marketCap = "market_cap"
        case marketCapRank = "market_cap_rank"
        case fullyDilutedValuation = "fully_diluted_valuation"
        case totalVolume = "total_volume"
        case high24H = "high_24h"
        case low24H = "low_24h"
        case priceChange24H = "price_change_24h"
        case priceChangePercentage24H = "price_change_percentage_24h"
        case marketCapChange24H = "market_cap_change_24h"
        case marketCapChangePercentage24H = "market_cap_change_percentage_24h"
        case circulatingSupply = "circulating_supply"
        case totalSupply = "total_supply"
        case maxSupply = "max_supply"
        case ath
        case athChangePercentage = "ath_change_percentage"
        case athDate = "ath_date"
        case atl
        case atlChangePercentage = "atl_change_percentage"
        case atlDate = "atl_date"
        case lastUpdated = "last_updated"
        case sparklineIn7D = "sparkline_in_7d"
        case currentHoldings
    }
    
    func updateHoldings(amount: Double) -> CoinModel {
        return CoinModel(id: id, symbol: symbol, name: name, image: image, currentPrice: currentPrice, marketCap: marketCap, marketCapRank: marketCapRank, fullyDilutedValuation: fullyDilutedValuation, totalVolume: totalVolume, high24H: high24H, low24H: low24H, priceChange24H: priceChange24H, priceChangePercentage24H: priceChangePercentage24H, marketCapChange24H: marketCapChange24H, marketCapChangePercentage24H: marketCapChangePercentage24H, circulatingSupply: circulatingSupply, totalSupply: totalSupply, maxSupply: maxSupply, ath: ath, athChangePercentage: athChangePercentage, athDate: athDate, atl: atl, atlChangePercentage: atlChangePercentage, atlDate: atlDate, lastUpdated: lastUpdated, sparklineIn7D: sparklineIn7D, currentHoldings: amount)
    }
    
    var currentHoldingsValue: Double {
        return (currentHoldings ?? 0) * currentPrice
    }
    
    var rank: Int {
        return Int(marketCapRank ?? 0)
    }
}
 
struct SparklineIn7D: Codable {
    let price: [Double]?
}
