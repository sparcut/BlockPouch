//
//  ActionButton.swift
//  BlockPouch
//
//  Created by Harrison on 13/5/2025.
//

import Foundation
import SwiftUI

struct ActionButton: View {
    let title: String
    let icon: String
    let foregroundColor: Color
    let backgroundColor: Color
    let action: (() -> Void)?
    
    init(title: String, icon: String, foregroundColor: Color? = nil, backgroundColor: Color? = nil, action: (() -> Void)? = nil) {
        self.title = title
        self.icon = icon
        self.foregroundColor = foregroundColor ?? .primary
        self.backgroundColor = backgroundColor ?? Color.blue.opacity(0.3)
        self.action = action
    }
    
    var body: some View {
        Button(action: { action?() }) {
            VStack {
                Image(systemName: icon)
                    .font(.title2)
                    .padding()
                    .background(backgroundColor)
                    .clipShape(Circle())
                    .foregroundStyle(foregroundColor)
                Text(title)
                    .foregroundStyle(foregroundColor)
            }
        }
    }
}
