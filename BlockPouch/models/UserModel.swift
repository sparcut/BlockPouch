//
//  UserModel.swift
//  BlockPouch
//
//  Created by Harrison on 12/5/2025.
//

import Foundation
import SwiftData

@Model
class UserModel: ObservableObject {
    @Attribute(.unique) var id: UUID
    @Attribute(.unique) var email: String
    var name: String
    var isLoggedIn: Bool
    @Relationship var pouch: PouchModel
    
    init(name: String, email: String, isLoggedIn: Bool) {
        let newId = UUID()
        self.id = newId
        self.name = name
        self.email = email
        self.pouch = PouchModel(
            userID: newId,
            ownedAssets: [
                OwnedAssetModel(
                    assetId: "BTC",
                    amount: 2.2,
                    transactions: []
                ),
                OwnedAssetModel(
                    assetId: "ETH",
                    amount: 10.82,
                    transactions: []
                ),
            ],
            balance: 45.50
        )
        self.isLoggedIn = isLoggedIn
    }
}
