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
        TabView {
            DashboardView()
                .tabItem {
                    Label("Dashboard", systemImage: "chart.bar.fill")
                }
                .environmentObject(marketDataController)
            
            MarketView()
                .tabItem {
                    Label("Dashboard", systemImage: "bitcoinsign.circle")
                }
                .environmentObject(marketDataController)
            
            PouchView()
                .tabItem {
                    Label("Pouch", systemImage: "handbag.fill")
                }
                .environmentObject(marketDataController)
            
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
		
#Preview {
    MainView()
}
