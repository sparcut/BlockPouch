//
//  CoinModel.swift
//  BlockPouch
//
//  Created by Harrison on 12/5/2025.
//

import Foundation

class CoinModel {
    let assetId: String
    let name: String
    var priceUSD: Double
    var priceDate: Date
    
    init(assetId: String, name: String, priceUSD: Double, priceDate: Date) {
        self.assetId = assetId
        self.name = name
        self.priceUSD = priceUSD
        self.priceDate = priceDate
    }
}
