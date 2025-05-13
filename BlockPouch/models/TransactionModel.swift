//
//  TransactionModel.swift
//  BlockPouch
//
//  Created by Harrison on 12/5/2025.
//

import Foundation
import SwiftData

enum TransactionType: String, Codable {
    case Buy
    case Sell
    case TransferIn
    case TransferOut
}

enum TransactionStatus: String, Codable {
    case Draft
    case Completed
}

@Model
class TransactionModel {
    var asset: AssetModel
    var type: TransactionType
    var status: TransactionStatus
    var quantity: Double
    var price: Double
    
    init(asset: AssetModel, type: TransactionType, status: TransactionStatus, quantity: Double, price: Double) {
        self.asset = asset
        self.type = type
        self.status = status
        self.quantity = quantity
        self.price = price
    }
}
