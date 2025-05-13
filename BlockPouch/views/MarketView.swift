//
//  MarketView.swift
//  BlockPouch
//
//  Created by Harrison on 12/5/2025.
//

import Foundation
import SwiftUI

struct MarketView: View {
    @EnvironmentObject private var marketDataController: MarketDataController
    @EnvironmentObject private var user: UserModel
    @State var selectedCurrency: CurrencyModel = CurrencyModel.all[0]
    
    var body: some View {
        VStack {
            CurrencySelectorComponent(selectedCurrency: $selectedCurrency)
            List(Array(marketDataController.assets.values.sorted(by: {$0.price > $1.price})), id: \.id) { a in
                HStack {
                    VStack(alignment: .leading) {
                        Text(a.name)
                            .font(.headline)
                        Text(a.id)
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                    Spacer()
                    VStack(alignment: .trailing) {
                        Text(a.price.asCurrency(using: selectedCurrency))
                            .bold()
                        Change24hComponent(amount: a.priceChange24h, percent: a.percentChange24h, currency: selectedCurrency)
                            .font(.caption)
                    }
                }
            }
            .refreshable {
                await marketDataController.fetchData()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onAppear {
            marketDataController.selectedCurrency = selectedCurrency
            marketDataController.startFetching()
        }
        .onChange(of: selectedCurrency) {
            marketDataController.selectedCurrency = selectedCurrency
        }
        .onDisappear {
            marketDataController.stopFetching()
        }
    }
}

#Preview {
    let marketDataController: MarketDataController = MarketDataController(useAPI: true)
    MarketView()
        .environmentObject(marketDataController)
}
