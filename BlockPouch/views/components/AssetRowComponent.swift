//
//  AssetRowComponent.swift
//  BlockPouch
//
//  Created by Harrison on 13/5/2025.
//

import Foundation
import SwiftUI

struct AssetRowComponent: View {
    let asset: AssetModel
    let currency: CurrencyModel
    
    var body: some View {
        HStack {
            Group {
                if let url = URL(string: asset.image) {
                    AsyncImage(url: url) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                        case .success(let image):
                            image
                                .resizable()
                                .scaledToFit()
                        default:
                            Image(systemName: "banknote.fill")
                        }
                    }
                }
            }
            .frame(width: 32)
            VStack(alignment: .leading) {
                Text(asset.name)
                    .font(.headline)
                Text(asset.id)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            Spacer()
            VStack(alignment: .trailing) {
                Text(asset.price.asCurrency(using: currency))
                    .bold()
                Change24hComponent(amount: asset.priceChange24h, percent: asset.percentChange24h, currency: currency)
                    .font(.caption)
            }
        }
    }
}
