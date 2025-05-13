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
            HStack {
                Image(systemName: "bitcoinsign.circle")
                    .resizable()
                    .scaledToFit()
                Image(systemName: "p.circle")
                    .resizable()
                    .scaledToFit()
            }
            .frame(height: 50.0)
            Text("BlockPouch")
                .font(.largeTitle)
                .bold()
            
            TextField("Email", text: $email)
                .textFieldStyle(.roundedBorder)
            SecureField("Password", text: $password)
                .textFieldStyle(.roundedBorder)
            Button("Login") {
                authController.authenticateLogin(email: email, password: password)
            }
            .buttonStyle(.borderedProminent)
        }
        .padding(.horizontal, 20.0)
    }
}

#Preview {
    LoginView()
}
	
