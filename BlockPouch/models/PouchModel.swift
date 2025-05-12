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
    var ownedAssets: [OwnedAssetModel]
    var balanceUSD: Double
    
    init(userID: UUID, ownedAssets: [OwnedAssetModel], balanceUSD: Double) {
        self.userID = userID
        self.ownedAssets = ownedAssets
        self.balanceUSD = balanceUSD
    }
    
    init(userID: UUID) {
        self.userID = userID
        self.ownedAssets = []
        self.balanceUSD = 0
    }
    
    func getTotalCoinValue() -> Double {
        var total: Double = 0
        
        for c in ownedAssets {
            total += c.getPriceUSD()
        }
        
        return total
    }
}
