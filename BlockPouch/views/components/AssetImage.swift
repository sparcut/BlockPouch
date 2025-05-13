//
//  AssetImage.swift
//  BlockPouch
//
//  Created by Harrison on 14/5/2025.
//

import Foundation
import SwiftUI

struct AssetImage: View {
    let imageUrl: String
    
    var body: some View {
        Group {
            if let url = URL(string: imageUrl) {
                AsyncImage(url: url) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFit()
                    default:
                        Image(systemName: "banknote.fill")
                    }
                }
            }
        }
        .frame(width: 32)
    }
}
