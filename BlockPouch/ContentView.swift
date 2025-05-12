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
    @StateObject private var navController: NavigationController = NavigationController()
    @AppStorage("isLoggedIn") private var isLoggedIn: Bool = false
    
    var body: some View {
        if(isLoggedIn) {
            MainView().modelContainer(modelContainer)
        } else {
            LoginView()
        }
    }
}

#Preview {
    ContentView()
}
