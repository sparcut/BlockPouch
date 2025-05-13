//
//  DashboardView.swift
//  BlockPouch
//
//  Created by Harrison on 12/5/2025.
//

import Foundation
import SwiftUI
import SwiftData

struct DashboardView: View {
    @EnvironmentObject private var marketDataController: MarketDataController
    @Bindable var user: UserModel
    private let currency: CurrencyModel = CurrencyModel.all[0]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                PouchOverviewComponent(user: user)
                    .environmentObject(marketDataController)
            }
            
            StackRounded(direction: StackDirection.horizontal) {
                NavigationLink(destination: TransferView()) {
                    ActionButton(title: "Trasfer", icon: "arrow.left.arrow.right")
                }
                
                NavigationLink(destination: Text("Coming Soon")) {
                    ActionButton(title: "Add Funds", icon: "plus")
                }
                
                NavigationLink(destination: Text("Coming Soon")) {
                    ActionButton(title: "Widthdraw", icon: "arrow.down")
                }
            }
            
            StackRounded(direction: StackDirection.vertical, spacing: 0) {
                Text("Recent Transactions")
                    .font(.title2)
                
                ForEach(user.pouch.getAllTransactions().prefix(3), id: \.id) { trans in
                    TransactionRow(transaction: trans, currency: currency)
                }
            }
            
            StackRounded(direction: StackDirection.vertical) {
                Text("Market Watch")
                    .font(.title2)
                Text("Top 5")
                    .font(.subheadline)
                ForEach(marketDataController.assets.values.sorted(by: { $0.price > $1.price }).prefix(5), id: \ .id) { asset in
                    AssetRowComponent(asset: asset, currency: currency)
                }
            }
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

//#Preview {
//    let marketDataController: MarketDataController = MarketDataController(useAPI: true)
//    let user = SampleDataFactory.makeUserModel()
//    DashboardView(user: $user)
//        .environmentObject(marketDataController)
//}
