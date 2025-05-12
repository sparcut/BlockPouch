//
//  CoinModel.swift
//  BlockPouch
//
//  Created by Harrison on 12/5/2025.
//

import Foundation
import SwiftData

@Model
class CoinModel {
    var assetId: String
    var name: String
    var priceUSD: Double
    var priceDate: Date
    
    init(assetId: String, name: String, priceUSD: Double, priceDate: Date) {
        self.assetId = assetId
        self.name = name
        self.priceUSD = priceUSD
        self.priceDate = priceDate
    }
}
