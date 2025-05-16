//
//  MainView.swift
//  BlockPouch
//
//  Created by Harrison on 12/5/2025.
//

import Foundation
import SwiftUI

struct MainView: View {
    @Binding var user: UserModel
    @StateObject private var marketDataController: MarketDataController = MarketDataController(useAPI: true)
    
    var body: some View {
        NavigationStack {
            TabView {
                DashboardView(user: $user)
                    .environmentObject(marketDataController)
                    .background(Color(.systemGroupedBackground))
                    .tabItem {
                        Label("Dashboard", systemImage: "chart.bar.fill")
                    }
                
                MarketView(user: $user)
                    .environmentObject(marketDataController)
                    .background(Color(.systemGroupedBackground))
                    .tabItem {
                        Label("Market", systemImage: "bitcoinsign.circle")
                    }
                
                PouchView(user: $user)
                    .environmentObject(marketDataController)
                    .background(Color(.systemGroupedBackground))
                    .tabItem {
                        Label("Pouch", systemImage: "handbag.fill")
                    }
                
                ProfileView(user: $user)
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
    let user = SampleDataFactory.makeUserModel()
    MainView(user: .constant(user))
        .modelContainer(for: [
            AssetModel.self,
            OwnedAssetModel.self,
            PouchModel.self,
            TransactionModel.self,
            UserModel.self,
        ])
}
