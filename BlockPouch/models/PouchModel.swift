//
//  PouchModel.swift
//  BlockPouch
//
//  Created by Harrison on 12/5/2025.
//

import Foundation
import SwiftData

@Model
class PouchModel {
    var userID: UUID
    @Relationship var ownedAssets: [OwnedAssetModel]
    var balance: Double
    
    init(userID: UUID, ownedAssets: [OwnedAssetModel], balance: Double) {
        self.userID = userID
        self.ownedAssets = ownedAssets
        self.balance = balance
    }
    
    init(userID: UUID) {
        self.userID = userID
        self.ownedAssets = []
        self.balance = 0
    }
}
