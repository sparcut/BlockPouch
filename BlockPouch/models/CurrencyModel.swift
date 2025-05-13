//
//  CurrencyModel.swift
//  BlockPouch
//
//  Created by Harrison on 13/5/2025.
//

import Foundation

struct CurrencyModel: Identifiable, Hashable {
    let id: String
    let currency: Locale.Currency
    let name: String
    let flag: String
    let locale: Locale
    
    init(id: String, name: String, flag: String, locale: String) {
        self.id = id
        self.currency = Locale.Currency(id)
        self.name = name
        self.flag = flag
        self.locale = Locale(identifier: locale)
    }
    
    static var all: [CurrencyModel] = [
        CurrencyModel(id: "USD", name: "US Dollar", flag: "🇺🇸", locale: "en_US"),
        CurrencyModel(id: "EUR", name: "Euro", flag: "🇪🇺", locale: "de_DE"),
        CurrencyModel(id: "AUD", name: "Australian Dollar", flag: "🇦🇺", locale: "en_AU"),
        CurrencyModel(id: "GBP", name: "British Pound", flag: "🇬🇧", locale: "en_GB"),
        CurrencyModel(id: "JPY", name: "Japanese Yen", flag: "🇯🇵", locale: "ja_JP")
    ]
}
