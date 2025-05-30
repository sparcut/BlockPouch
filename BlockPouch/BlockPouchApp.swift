//
//  BlockPouchApp.swift
//  BlockPouch
//
//  Created by Harrison on 12/5/2025.
//

import SwiftUI
import SwiftData

@main
struct BlockPouchApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            AssetModel.self,
            OwnedAssetModel.self,
            PouchModel.self,
            TransactionModel.self,
            UserModel.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
