//
//  PouchView.swift
//  BlockPouch
//
//  Created by Harrison on 12/5/2025.
//

import Foundation
import SwiftUI

struct PouchView: View {
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
        VStack(alignment: .leading, spacing: 8) {
            PouchOverviewComponent(pouchData: pouchData)
                .environmentObject(marketDataController)

            List(Array(pouchData.ownedAssets.enumerated()), id: \.element.id) { i, a in
                OwnedAssetComponent(ownedAsset: a)
            }
            .scrollContentBackground(.hidden)
            .padding(.top, -24)
            .refreshable {
                await marketDataController.fetchData()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.systemGroupedBackground))
        .onAppear() {
            Task {
                await marketDataController.fetchData()
            }
        }
    }
}

#Preview {
    let marketDataController: MarketDataController = MarketDataController(useAPI: true)
    PouchView()
        .environmentObject(marketDataController)
}
