//
//  MainView.swift
//  BlockPouch
//
//  Created by Harrison on 12/5/2025.
//

import Foundation
import SwiftUI

struct MainView: View {
    
    var body: some View {
        TabView {
            DashboardView()
                .tabItem {
                    Label("Dashboard", systemImage: "chart.bar.fill")
                }
            
            MarketView()
                .tabItem {
                    Label("Dashboard", systemImage: "bitcoinsign.circle")
                }
            
            PouchView()
                .tabItem {
                    Label("Pouch", systemImage: "wallet.pass.fill")
                }
            
            ProfileView()
                .tabItem {
                    Label("Pouch", systemImage: "person.crop.circle")
                }
        }
    }
}
