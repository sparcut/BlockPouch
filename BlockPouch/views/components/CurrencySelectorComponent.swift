//
//  CurrencySelectorComponent.swift
//  BlockPouch
//
//  Created by Harrison on 13/5/2025.
//

import Foundation
import SwiftUI

struct CurrencySelectorComponent: View {
    @Binding var selectedCurrency: Locale.Currency
    
    let availableCurrencies: [(currency: Locale.Currency, flag: String, name: String)] = [
        (Locale.Currency("USD"), "🇺🇸", "US Dollar"),
        (Locale.Currency("EUR"), "🇪🇺", "Euro"),
        (Locale.Currency("AUD"), "🇦🇺", "Australian Dollar"),
        (Locale.Currency("GBP"), "🇬🇧", "Great British Pound")
    ]
    
    var body: some View {
        VStack {
            Picker("Currency", selection: $selectedCurrency) {
                ForEach(availableCurrencies, id: \.currency) { item in
                    Text("\(item.flag) \(item.name) (\(item.currency.identifier))")
                        .tag(item.currency)
                }
            }
            .pickerStyle(.menu)
        }
    }
}
