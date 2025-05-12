//
//  AuthenticationController.swift
//  BlockPouch
//
//  Created by Harrison on 12/5/2025.
//

import Foundation
import SwiftUI

class AuthenticationController {
    @AppStorage("isLoggedIn") private var isLoggedIn: Bool = false
    
    func authenticateLogin(email: String, password: String) {
        // Connect and authenticate credentials
        
        // Set value of login
        isLoggedIn = true
    }
}
