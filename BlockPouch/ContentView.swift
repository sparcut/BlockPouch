//
//  ContentView.swift
//  BlockPouch
//
//  Created by Harrison on 12/5/2025.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @StateObject private var navController: NavigationController = NavigationController()

    var body: some View {
        NavigationStack(path: $navController.path) {
            Text("Stub")
        }
        .environmentObject(navController)
    }
}

#Preview {
    ContentView()
}
