//
//  ContentView.swift
//  BlockPouch
//
//  Created by Harrison on 12/5/2025.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    var modelContainer: ModelContainer = {
        let schema = Schema(
            [
                UserModel.self,
                AssetModel.self,
                OwnedAssetModel.self,
                TransactionModel.self,
                PouchModel.self,
            ]
        )
        let config = ModelConfiguration(schema: schema)
        return try! ModelContainer(for: schema, configurations: [config])
    }()
    
    @StateObject private var user: UserModel = UserModel(name: "Harrison", email: "harrison@gmail.com", isLoggedIn: true)
    
    var body: some View {
        if(user.isLoggedIn) {
            MainView(user: user)
                .modelContainer(modelContainer)
        } else {
            LoginView()
                .modelContainer(modelContainer)
        }
    }
}

#Preview {
    ContentView()
}
