//
//  Change24hComponent.swift
//  BlockPouch
//
//  Created by Harrison on 13/5/2025.
//

import Foundation
import SwiftUI

struct Change24hComponent: View {
    let amount: Double
    let percent: Double
    let currency: Locale.Currency
    
    var body: some View {
        var changeIcon: Image? = nil
        var fontColor: Color? = nil
            
        if(amount > 0) {
            changeIcon = Image(systemName: "chevron.up.2")
            fontColor = .green
        } else if(amount < 0) {
            changeIcon = Image(systemName: "chevron.down.2")
            fontColor = .red
        }
        
        let content = HStack(spacing: 4) {
            Text("\(amount.asCurrency(using: currency, useSymbol: false)) (\(percent.asPercentage()))")
            if(changeIcon != nil) {
                changeIcon
            }
        }
        
        if let fontColor: Color {
            return AnyView(content.foregroundColor(fontColor))
        } else {
            return AnyView(content)
        }
    }
}

#Preview {
    let currency: Locale.Currency = Locale.Currency("USD")
    Change24hComponent(amount: 299900, percent: 2.320, currency: currency)
    Change24hComponent(amount: -10, percent: -2.320, currency: currency)
}
