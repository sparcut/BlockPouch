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
    var id: String
    var name: String
    var priceUSD: Double
    var priceDate: Date
    var changeLast24h: Double
    
    init(id: String, name: String, priceUSD: Double, priceDate: Date, changeLast24h: Double) {
        self.id = id
        self.name = name
        self.priceUSD = priceUSD
        self.priceDate = priceDate
        self.changeLast24h = changeLast24h
    }
}
