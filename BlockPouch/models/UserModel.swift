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
    var name: String
    var email: String
    var pouch: PouchModel
    
    
    init(id: UUID, name: String, email: String, pouch: PouchModel) {
        self.id = id
        self.name = name
        self.email = email
        self.pouch = pouch
    }
}
