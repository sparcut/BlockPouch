//
//  TransactionRow.swift
//  BlockPouch
//
//  Created by Harrison on 13/5/2025.
//

import Foundation
import SwiftUI

struct TransactionRow: View {
    var transaction: TransactionModel
    var currency: CurrencyModel
    
    var body: some View {
        HStack {
            Text(transaction.assetId)
                .font(.headline)
            Text(transaction.date.formatted(date: .abbreviated, time: .omitted))
                .font(.caption)
                .foregroundStyle(.secondary)
            Spacer()
            Text(transaction.quantity.noTrailingZeros())
                .font(.subheadline)
            Text(transaction.price.asCurrency(using: currency))
                .font(.caption)
                .foregroundStyle(.secondary)
            
        }
        .padding()
    }
}
