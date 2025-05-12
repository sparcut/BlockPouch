//
//  OwnedCoinModel.swift
//  BlockPouch
//
//  Created by Harrison on 12/5/2025.
//

import Foundation

class OwnedCoinModel {
    let coin: CoinModel
    var amount: Double
    var transactions: [TransactionModel]
    
    init(coin: CoinModel, amount: Double, transactions: [TransactionModel]) {
        self.coin = coin
        self.amount = amount
        self.transactions = transactions
    }
}
