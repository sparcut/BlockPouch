//
//  MarketView.swift
//  BlockPouch
//
//  Created by Harrison on 12/5/2025.
//

import Foundation
import SwiftUI

struct MarketView: View {
    @State private var coins: [CoinModel] = [
        CoinModel(id: "BTC", name: "Bitcoin", priceUSD: 65235.84, priceDate: Date(), changeLast24h: 1629.24),
        CoinModel(id: "ETH", name: "Ethereum", priceUSD: 2932.27, priceDate: Date(), changeLast24h: -121.79)
    ]
    
    var body: some View {
        List(Array(coins.enumerated()), id: \.element.id) { i, c in
            HStack {
                VStack(alignment: .leading) {
                    Text(c.name)
                        .font(.headline)
                    Text(c.id)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
                Spacer()
                VStack(alignment: .trailing) {
                    Text("$\(c.priceUSD, specifier: "%.2f")")
                        .bold()
                    Text("\(c.changeLast24h >= 0 ? "+" : "")\(c.changeLast24h, specifier: "%.2f")")
                        .foregroundColor(c.changeLast24h >= 0 ? .green : .red)
                        .font(.caption)
                }
            }
        }
    }

}

#Preview {	
    MarketView()
}
