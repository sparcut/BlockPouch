//
//  TransactionModel.swift
//  BlockPouch
//
//  Created by Harrison on 12/5/2025.
//

import Foundation

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

class TransactionModel {
    let coin: CoinModel
    let type: TransactionType
    var status: TransactionStatus
    
    init(coin: CoinModel, type: TransactionType, status: TransactionStatus) {
        self.coin = coin
        self.type = type
        self.status = status
    }
}
