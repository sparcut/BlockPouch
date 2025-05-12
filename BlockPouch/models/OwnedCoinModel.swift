//
//  OwnedCoinModel.swift
//  BlockPouch
//
//  Created by Harrison on 12/5/2025.
//

import Foundation
import SwiftData

@Model
class OwnedCoinModel {
    var coin: CoinModel
    var amount: Double
    var transactions: [TransactionModel]
    
    init(coin: CoinModel, amount: Double, transactions: [TransactionModel]) {
        self.coin = coin
        self.amount = amount
        self.transactions = transactions
    }
    
    func getPriceUSD() -> Double {
        return coin.priceUSD * amount
    }
    
    func getPriceChanged24h() -> Double {
        return amount * coin.changeLast24h
    }
}
