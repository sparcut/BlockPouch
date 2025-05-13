//
//  MainView.swift
//  BlockPouch
//
//  Created by Harrison on 12/5/2025.
//

import Foundation
import SwiftUI

struct MainView: View {
    @StateObject private var marketDataController: MarketDataController = MarketDataController(useAPI: true)
    
    var body: some View {
        NavigationStack {
            TabView {
                DashboardView()
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
                
                PouchView()
                    .environmentObject(marketDataController)
                    .background(Color(.systemGroupedBackground))
                    .tabItem {
                        Label("Pouch", systemImage: "handbag.fill")
                    }
                
                ProfileView()
                    .tabItem {
                        Label("Profile", systemImage: "person.crop.circle")
                    }
            }
            .onAppear() {
                UITabBar.appearance().backgroundColor = .systemBackground
            }
        }
    }
}
		
#Preview {
    MainView()
}
