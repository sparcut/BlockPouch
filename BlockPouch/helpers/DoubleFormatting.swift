//
//  DoubleFormatting.swift
//  BlockPouch
//
//  Created by Harrison on 13/5/2025.
//

import Foundation

extension Double {
    func asCurrency(using: CurrencyModel, useSymbol: Bool? = nil) -> String {
        let useSymbol = useSymbol ?? true
        
        let formatter: NumberFormatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        formatter.locale = using.locale
        formatter.currencyCode = using.id
        
        if(useSymbol) {
            formatter.numberStyle = .currency
        } else {
            formatter.numberStyle = .decimal
        }
        
        return formatter.string(from: NSNumber(value: self)) ?? "\(self)"
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
