//
//  PouchCoinListItem.swift
//  BlockPouch
//
//  Created by Harrison on 12/5/2025.
//

import Foundation
import SwiftUI

struct PouchCoinListItem: View {
    var ownedCoin: OwnedCoinModel
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                HStack {
                    Text(ownedCoin.coin.name)
                        .font(.headline)
                    Text(ownedCoin.coin.id)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
                Text("\(ownedCoin.amount, specifier: "%g")")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }

            Spacer()

            VStack(alignment: .trailing) {
                Text(
                    "\(ownedCoin.coin.changeLast24h >= 0 ? "+" : "")\(ownedCoin.coin.changeLast24h, specifier: "%.2f")"
                )
                .foregroundColor(
                    ownedCoin.coin.changeLast24h >= 0 ? .green : .red
                )
                .bold()

                Text("$\(ownedCoin.getPriceUSD(), specifier: "%.2f")")
                    .font(.caption)
            }
        }
    }
}
