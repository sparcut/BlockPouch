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
    var pouch: PouchModel
    var loggedIn: Bool
    
    
    init(id: UUID, name: String, email: String, pouch: PouchModel, loggedIn: Bool) {
        self.id = id
        self.name = name
        self.email = email
        self.pouch = pouch
        self.loggedIn = loggedIn
    }
}
