//
//  CurrencySelectorComponent.swift
//  BlockPouch
//
//  Created by Harrison on 13/5/2025.
//

import Foundation
import SwiftUI

struct CurrencySelectorComponent: View {
    @Binding var selectedCurrency: CurrencyModel
    
    var body: some View {
        VStack {
            Picker("Currency", selection: $selectedCurrency) {
                ForEach(CurrencyModel.all, id: \.id) { item in
                    Text("\(item.flag) \(item.name) (\(item.currency.identifier))")
                        .tag(item)
                }
            }
            .pickerStyle(.menu)
            .padding(.horizontal)
            .background(Color(.systemBackground))
            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
        }
    }
}
