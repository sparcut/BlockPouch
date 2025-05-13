//
//  ContentView.swift
//  BlockPouch
//
//  Created by Harrison on 12/5/2025.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContent: ModelContext
    @State private var user: UserModel = SampleDataFactory.makeUserModel()
    
    var body: some View {
        if(user.isLoggedIn) {
            MainView(user: $user)
        } else {
            LoginView(user: $user)
        }
    }
}

#Preview {
    ContentView()
}
