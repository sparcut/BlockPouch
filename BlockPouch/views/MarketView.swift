//
//  MarketView.swift
//  BlockPouch
//
//  Created by Harrison on 12/5/2025.
//

import Foundation
import SwiftUI

struct MarketView: View {
    @State private var assets: [AssetModel] = [
        AssetModel(id: "BTC", name: "Bitcoin", priceUSD: 65235.84, priceDate: Date(), changeLast24h: 1629.24),
        AssetModel(id: "ETH", name: "Ethereum", priceUSD: 2932.27, priceDate: Date(), changeLast24h: -121.79)
    ]
    
    var body: some View {
        List(Array(assets.enumerated()), id: \.element.id) { i, a in
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
    }

}

#Preview {	
    MarketView()
}
