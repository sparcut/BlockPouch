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
    
    var body: some View {
        VStack {
            Image(systemName: icon)
                .font(.title2)
                .padding()
                .background(Color.blue.opacity(0.3))
                .clipShape(Circle())
                .foregroundStyle(.primary)
            Text(title)
                .foregroundStyle(.primary)
        }
    }
}
