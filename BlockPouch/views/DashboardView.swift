//
//  DashboardView.swift
//  BlockPouch
//
//  Created by Harrison on 12/5/2025.
//

import Foundation
import SwiftUI

struct DashboardView: View {
    @EnvironmentObject private var marketDataController: MarketDataController
    @Bindable var pouch: PouchModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                PouchOverviewComponent(pouch: pouch)
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
    let user: UserModel = UserModel(name: "Harrison", email: "harrison@gmail.com", isLoggedIn: true)
    DashboardView(pouch: user.pouch)
        .environmentObject(marketDataController)
}
