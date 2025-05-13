//
//  CoinModel.swift
//  BlockPouch
//
//  Created by Harrison on 12/5/2025.
//

import Foundation
import SwiftData

@Model
class AssetModel {
    var id: String
    var name: String
    var image: String
    var price: Double
    var priceDate: Date
    var priceChange24h: Double
    var percentChange24h: Double
    
    init(id: String, name: String, image: String, price: Double, priceDate: Date, priceChange24h: Double, percentChange24h: Double) {
        self.id = id
        self.name = name
        self.image = image
        self.price = price
        self.priceDate = priceDate
        self.priceChange24h = priceChange24h
        self.percentChange24h = percentChange24h
    }
}
