//
//  TransactionModel.swift
//  BlockPouch
//
//  Created by Harrison on 12/5/2025.
//

import Foundation
import SwiftData

enum TransactionType {
    case Buy
    case Sell
    case TransferIn
    case TransferOut
}

enum TransactionStatus {
    case Draft
    case Completed
}

@Model
class TransactionModel {
    var coin: CoinModel
    var type: TransactionType
    var status: TransactionStatus
    var quantity: Double
    var priceUSD: Double
    
    init(coin: CoinModel, type: TransactionType, status: TransactionStatus, quantity: Double, priceUSD: Double) {
        self.coin = coin
        self.type = type
        self.status = status
        self.quantity = quantity
        self.priceUSD = priceUSD
    }
}
