//
//  OwnedCoinModel.swift
//  BlockPouch
//
//  Created by Harrison on 12/5/2025.
//

import Foundation
import SwiftData

@Model
class OwnedAssetModel {
    var asset: AssetModel
    var amount: Double
    var transactions: [TransactionModel]
    
    init(asset: AssetModel, amount: Double, transactions: [TransactionModel]) {
        self.asset = asset
        self.amount = amount
        self.transactions = transactions
    }
    
    func getPriceUSD() -> Double {
        return asset.priceUSD * amount
    }
    
    func getPriceChanged24h() -> Double {
        return amount * asset.changeLast24h
    }
}
