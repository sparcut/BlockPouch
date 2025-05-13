//
//  OwnedAssetComponent.swift
//  BlockPouch
//
//  Created by Harrison on 12/5/2025.
//

import Foundation
import SwiftUI

struct OwnedAssetComponent: View {
    @EnvironmentObject var marketDataController: MarketDataController
    var ownedAsset: OwnedAssetModel
    private let currency: CurrencyModel = CurrencyModel.all[0]

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                HStack {
                    Text(marketDataController.assets[ownedAsset.assetId]?.name ?? ownedAsset.assetId)
                        .font(.headline)
                    Text(ownedAsset.assetId)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
                Text(ownedAsset.amount.noTrailingZeros())
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }

            Spacer()

            VStack(alignment: .trailing) {
                let price: Double = (marketDataController.assets[ownedAsset.assetId]?.price ?? 0) * ownedAsset.amount
                Text(price.asCurrency(using: currency))
                
                let priceChange24h = (marketDataController.assets[ownedAsset.assetId]?.priceChange24h ?? 0) * ownedAsset.amount
                let percentChange24h = (marketDataController.assets[ownedAsset.assetId]?.percentChange24h ?? 0)
                Change24hComponent(amount: priceChange24h, percent: percentChange24h, currency: currency)
                    .font(.caption)
            }
        }
    }
}
