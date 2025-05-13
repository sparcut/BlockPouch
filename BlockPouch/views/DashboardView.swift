//
//  DashboardView.swift
//  BlockPouch
//
//  Created by Harrison on 12/5/2025.
//

import Foundation
import SwiftUI

struct DashboardView: View {
    @EnvironmentObject var marketDataController: MarketDataController
    private var pouchData = PouchModel(
        userID: UUID(),
        ownedAssets: [
            OwnedAssetModel(
                assetId: "BTC",
                amount: 2.2,
                transactions: []
            ),
            OwnedAssetModel(
                assetId: "ETH",
                amount: 10.82,
                transactions: []
            ),
        ],
        balance: 45.50
    )
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                PouchOverviewComponent(pouchData: pouchData)
                    .environmentObject(marketDataController)
            }
            
            HStack(spacing: 16) {
                NavigationLink(destination: TransferView()) {
                    ActionButton(title: "Trasfer", icon: "arrow.left.arrow.right")
                }
                
                NavigationLink(destination: Text("Stub")) {
                    ActionButton(title: "Add Funds", icon: "plus")
                }
                
                NavigationLink(destination: Text("Stub")) {
                    ActionButton(title: "Widthdraw", icon: "arrow.down")
                }
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color(.systemBackground))
            )
            .padding(.horizontal)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.systemGroupedBackground))
        .onAppear {
            Task {
                await marketDataController.fetchData()
            }
        }
    }
}

#Preview {
    let marketDataController: MarketDataController = MarketDataController(useAPI: true)
    DashboardView()
        .environmentObject(marketDataController)
}
