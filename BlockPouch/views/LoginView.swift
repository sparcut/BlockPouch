//
//  LoginView.swift
//  BlockPouch
//
//  Created by Harrison on 12/5/2025.
//

import Foundation
import SwiftUI

struct LoginView: View {
    @EnvironmentObject private var navController: NavigationController
    @State var email: String = ""
    @State var password: String = ""
    
    var body: some View {
        VStack {
            Text("BlockPouch")
            
            TextField("Email", text: $email)
            TextField("Password", text: $password)
            Button("Login") {
                navController.navigate(to: .main)
            }
        }
    }
}

#Preview {
    LoginView()
}
