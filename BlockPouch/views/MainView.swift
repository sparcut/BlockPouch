//
//  MainView.swift
//  BlockPouch
//
//  Created by Harrison on 12/5/2025.
//

import Foundation
import SwiftUI

struct MainView: View {
    @Bindable var user: UserModel
    @StateObject private var marketDataController: MarketDataController = MarketDataController(useAPI: true)
    
    var body: some View {
        NavigationStack {
            TabView {
                DashboardView(pouch: user.pouch)
                    .environmentObject(marketDataController)
                    .background(Color(.systemGroupedBackground))
                    .tabItem {
                        Label("Dashboard", systemImage: "chart.bar.fill")
                    }
                
                MarketView()
                    .environmentObject(marketDataController)
                    .background(Color(.systemGroupedBackground))
                    .tabItem {
                        Label("Market", systemImage: "bitcoinsign.circle")
                    }
                
                PouchView(pouch: user.pouch)
                    .environmentObject(marketDataController)
                    .background(Color(.systemGroupedBackground))
                    .tabItem {
                        Label("Pouch", systemImage: "handbag.fill")
                    }
                
                ProfileView()
                    .tabItem {
                        Label("Profile", systemImage: "person.crop.circle")
                    }
                    .environmentObject(user)
            }
            .onAppear() {
                UITabBar.appearance().backgroundColor = .systemBackground
            }
        }
    }
}
		
#Preview {
    let user: UserModel = UserModel(name: "Harrison", email: "harrison@gmail.com", isLoggedIn: true)
    MainView(user: user)
}
