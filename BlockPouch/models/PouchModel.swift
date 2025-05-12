//
//  PouchModel.swift
//  BlockPouch
//
//  Created by Harrison on 12/5/2025.
//

import Foundation
import SwiftData

@Model
class PouchModel {
    var coins: [OwnedCoinModel]
    var transactions: [TransactionModel]
    
    init(coins: [OwnedCoinModel], transactions: [TransactionModel]) {
        self.coins = coins
        self.transactions = transactions
    }
}
