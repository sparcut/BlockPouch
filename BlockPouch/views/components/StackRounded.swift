//
//  StackRounded.swift
//  BlockPouch
//
//  Created by Harrison on 13/5/2025.
//

import Foundation
import SwiftUI

enum StackDirection {
    case horizontal
    case vertical
}

struct StackRounded<Content: View>: View {
    let direction: StackDirection
    let spacing: CGFloat
    let content: () -> Content
    init(direction: StackDirection, spacing: CGFloat? = nil, @ViewBuilder content: @escaping () -> Content) {
        self.direction = direction
        self.spacing = spacing ?? 8
        self.content = content
    }
    
    var body: some View {
        Group {
            if(direction == .horizontal) {
                HStack(spacing: spacing) {
                    content()
                }
            } else {
                VStack(spacing: spacing) {
                    content()
                }
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color(.systemBackground))
        )
        .padding(.horizontal)
    }
}
