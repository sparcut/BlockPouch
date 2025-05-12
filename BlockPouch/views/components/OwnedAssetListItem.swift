//
//  PouchCoinListItem.swift
//  BlockPouch
//
//  Created by Harrison on 12/5/2025.
//

import Foundation
import SwiftUI

struct PouchCoinListItem: View {
    var ownedAsset: OwnedAssetModel
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                HStack {
                    Text(ownedAsset.asset.name)
                        .font(.headline)
                    Text(ownedAsset.asset.id)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
                Text("\(ownedAsset.amount, specifier: "%g")")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }

            Spacer()

            VStack(alignment: .trailing) {
                Text(
                    "\(ownedAsset.asset.changeLast24h >= 0 ? "+" : "")\(ownedAsset.asset.changeLast24h, specifier: "%.2f")"
                )
                .foregroundColor(
                    ownedAsset.asset.changeLast24h >= 0 ? .green : .red
                )
                .bold()

                Text("$\(ownedAsset.getPriceUSD(), specifier: "%.2f")")
                    .font(.caption)
            }
        }
    }
}
