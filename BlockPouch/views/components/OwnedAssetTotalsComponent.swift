//
//  OwnedAssetTotalsComponent.swift
//  BlockPouch
//
//  Created by Harrison on 13/5/2025.
//

import Foundation
import SwiftUI

struct OwnedAssetTotalsComponent: View {
    @EnvironmentObject var marketDataController: MarketDataController
    @State var pouchData: PouchModel
    private let currency: Locale.Currency = Locale.Currency("USD")
        
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                let (totalAssets, totalPriceChange24h, totalPercentChange24h) =
                pouchData.ownedAssets.reduce(into: (0, 0, 0)) { result, owned in
                    if let asset = marketDataController.assets[owned.assetId] {
                        result.0 += asset.price * owned.amount
                        result.1 += asset.priceChange24h * owned.amount
                        result.2 += asset.percentChange24h
                    }
                }
                
                Text("Total Assets")
                Text(totalAssets.asCurrency(using: currency))
                    .font(.title2)
                Change24hComponent(amount: totalPriceChange24h, percent: totalPercentChange24h, currency: currency)
            }
            
            Spacer()
            
            VStack(alignment: .trailing) {
                Text("Balance")
                Text(pouchData.balance.asCurrency(using: currency))
                    .font(.title2)
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color(.systemBackground))
        )
        .padding(.horizontal)
    }
}
