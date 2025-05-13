//
//  UserModel.swift
//  BlockPouch
//
//  Created by Harrison on 12/5/2025.
//

import Foundation
import SwiftData

@Model
class UserModel {
    @Attribute(.unique) var id: UUID
    @Attribute(.unique) var email: String
    var name: String
    var isLoggedIn: Bool
    @Relationship var pouch: PouchModel

    init(id: UUID, name: String, email: String, isLoggedIn: Bool, pouch: PouchModel) {
        self.id = id
        self.name = name
        self.email = email
        self.isLoggedIn = isLoggedIn
        self.pouch = pouch
    }
}
