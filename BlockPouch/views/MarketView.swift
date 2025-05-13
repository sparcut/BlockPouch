//
//  MarketView.swift
//  BlockPouch
//
//  Created by Harrison on 12/5/2025.
//

import Foundation
import SwiftUI

struct MarketView: View {
    @EnvironmentObject var marketDataController: MarketDataController
    @State var selectedCurrency: Locale.Currency = Locale.Currency("USD")
    
    var body: some View {
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
        .navigationTitle("Market")
        .onAppear {
            marketDataController.selectedCurrency = selectedCurrency
            marketDataController.startFetching()
        }
        .onDisappear {
            marketDataController.stopFetching()
        }
        .refreshable {
            await marketDataController.fetchData()
        }
        .onChange(of: selectedCurrency) {
            marketDataController.selectedCurrency = selectedCurrency
        }
    }
}

#Preview {
    let marketDataController: MarketDataController = MarketDataController(useAPI: true)
    MarketView()
        .environmentObject(marketDataController)
}
