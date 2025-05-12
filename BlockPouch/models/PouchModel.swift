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
    var coins: [OwnedCoinModel]
    
    init(userID: UUID, coins: [OwnedCoinModel]) {
        self.userID = userID
        self.coins = coins
    }
    
    init(userID: UUID) {
        self.userID = userID
        self.coins = []
    }
}
