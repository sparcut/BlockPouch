//
//  LoginView.swift
//  BlockPouch
//
//  Created by Harrison on 12/5/2025.
//

import Foundation
import SwiftUI

struct LoginView: View {
    var authController = AuthenticationController()
    @AppStorage("isLoggedIn") private var isLoggedIn: Bool = false
    @State var email: String = ""
    @State var password: String = ""
    
    var body: some View {
        VStack {
            Text("BlockPouch")
                .font(.largeTitle)
                .bold()
            
            TextField("Email", text: $email)
                .textFieldStyle(.roundedBorder)
            TextField("Password", text: $password)
                .textFieldStyle(.roundedBorder)
            Button("Login") {
                authController.authenticateLogin(email: email, password: password)
            }
            .buttonStyle(.borderedProminent)
        }
    }
}

#Preview {
    LoginView()
}
