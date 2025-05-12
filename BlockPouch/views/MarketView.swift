//
//  MarketView.swift
//  BlockPouch
//
//  Created by Harrison on 12/5/2025.
//

import Foundation
import SwiftUI

struct MarketView: View {
    @StateObject private var marketDataController = MarketDataController()
    
    var body: some View {
        List(Array(marketDataController.assets.enumerated()), id: \.element.id) { i, a in
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
                    Text("$\(a.priceUSD, specifier: "%.2f")")
                        .bold()
                    Text("\(a.changeLast24h >= 0 ? "+" : "")\(a.changeLast24h, specifier: "%.2f")")
                        .foregroundColor(a.changeLast24h >= 0 ? .green : .red)
                        .font(.caption)
                }
            }
        }
        .navigationTitle("Market")
        .onAppear {
            marketDataController.startFetching()
        }
        .onDisappear {
            marketDataController.stopFetching()
        }
        .refreshable {
            await marketDataController.fetchDataAsync()
        }
    }
}

#Preview {	
    MarketView()
}
