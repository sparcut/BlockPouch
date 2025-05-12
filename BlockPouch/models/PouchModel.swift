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
    var userID: UUID
    var coins: [OwnedCoinModel]
    var balanceUSD: Double
    
    init(userID: UUID, coins: [OwnedCoinModel], balanceUSD: Double) {
        self.userID = userID
        self.coins = coins
        self.balanceUSD = balanceUSD
    }
    
    init(userID: UUID) {
        self.userID = userID
        self.coins = []
        self.balanceUSD = 0
    }
    
    func getTotalCoinValue() -> Double {
        var total: Double = 0
        
        for c in coins {
            total += c.getPriceUSD()
        }
        
        return total
    }
}
