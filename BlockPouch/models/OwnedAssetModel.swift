//
//  OwnedAssetModel.swift
//  BlockPouch
//
//  Created by Harrison on 12/5/2025.
//

import Foundation
import SwiftData

@Model
class OwnedAssetModel {
    var assetId: String
    var amount: Double
    @Relationship var transactions: [TransactionModel]
    
    init(assetId: String, amount: Double, transactions: [TransactionModel]) {
        self.assetId = assetId
        self.amount = amount
        self.transactions = transactions
    }
}
