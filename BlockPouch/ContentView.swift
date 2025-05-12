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
    @AppStorage("isLoggedIn") private var isLoggedIn: Bool = false
    
    var body: some View {
        if(isLoggedIn) {
            MainView()
        } else {
            LoginView()
        }
    }
}

#Preview {
    ContentView()
}
