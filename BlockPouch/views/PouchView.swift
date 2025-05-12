//
//  PouchView.swift
//  BlockPouch
//
//  Created by Harrison on 12/5/2025.
//

import Foundation
import SwiftUI

struct PouchView: View {
    @State private var pouchData = PouchModel(
        userID: UUID(),
        ownedAssets: [
            OwnedAssetModel(
                asset: AssetModel(
                    id: "BTC", name: "Bitcoin", priceUSD: 65235.84,
                    priceDate: Date(), changeLast24h: 1629.24),
                amount: 2.2,
                transactions: []
            ),
            OwnedAssetModel(
                asset: AssetModel(
                    id: "ETH", name: "Ethereum", priceUSD: 2932.27,
                    priceDate: Date(), changeLast24h: -121.79),
                amount: 10.82,
                transactions: []
            ),
        ],
        balanceUSD: 45.50
    )

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                VStack(alignment: .leading) {
                    Text("Total Assets")
                    Text("$\(pouchData.getTotalCoinValue(), specifier: "%.2f")")
                        .font(.title2)
                }
                Spacer()
                VStack(alignment: .trailing) {
                    Text("Balance")
                    Text("$\(pouchData.balanceUSD, specifier: "%.2f")")
                        .font(.title2)
                }
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color(.systemBackground))
            )
            .padding(.horizontal)

            List(Array(pouchData.ownedAssets.enumerated()), id: \.element.id) { i, a in
                PouchCoinListItem(ownedAsset: a)
            }
            .scrollContentBackground(.hidden)
            .padding(.top, -24)
        }
        .background(Color(.systemGroupedBackground))
    }
}

#Preview {
    PouchView()
}
