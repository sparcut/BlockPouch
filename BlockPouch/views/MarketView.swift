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
    @Binding var user: UserModel
    @State var selectedCurrency: CurrencyModel = CurrencyModel.all[0]
    
    var body: some View {
        StackRounded(direction: StackDirection.vertical, spacing: 8) {
            CurrencySelectorComponent(selectedCurrency: $selectedCurrency)
            
            Divider()
            
            List(Array(marketDataController.assets.values.sorted(by: {$0.price > $1.price})), id: \.id) { a in
                AssetRowComponent(asset: a, currency: selectedCurrency)
            }
            .listStyle(.plain)
            .refreshable {
                await marketDataController.fetchData()
            }
        }
        .padding(.bottom, 8)
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

//#Preview {
//    let marketDataController: MarketDataController = MarketDataController(useAPI: true)
//    MarketView()
//        .environmentObject(marketDataController)
//}
