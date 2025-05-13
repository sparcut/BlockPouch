//
//  DoubleFormatting.swift
//  BlockPouch
//
//  Created by Harrison on 13/5/2025.
//

import Foundation

extension Double {
    func asCurrency(using: Locale.Currency, useSymbol: Bool? = nil) -> String {
        let useSymbol = useSymbol ?? true
        
        let formatter: NumberFormatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.locale = Locale(identifier: "en_US")
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        let symbol: String = useSymbol ? (formatter.currencySymbol ?? "") : ""
        
        return "\(symbol + " ")\(formatter.string(from: NSNumber(value: self)) ?? "\(self)")"
        /*return self.formatted(.currency(code: using.identifier).locale(Locale(identifier: "en_US")))*/
    }
    
    func asPercentage() -> String {
        let symbol = self > 0 ? "+" : self < 0 ? "-" : ""
        return String(format: "%@%.2f%%", symbol, abs(self))
    }
    
    func noTrailingZeros() -> String {
        if(self.truncatingRemainder(dividingBy: 1) == 0) {
            return String(format: "%.0f", self)
        } else {
            return String(self)
        }
    }
}
