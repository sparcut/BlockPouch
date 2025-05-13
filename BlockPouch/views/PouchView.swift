//
//  PouchView.swift
//  BlockPouch
//
//  Created by Harrison on 12/5/2025.
//

import Foundation
import SwiftUI

struct PouchView: View {
    @EnvironmentObject private var marketDataController: MarketDataController
    @Bindable var pouch: PouchModel

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            PouchOverviewComponent(pouch: pouch)
                .environmentObject(marketDataController)

            List(Array(pouch.ownedAssets.enumerated()), id: \.element.id) { i, a in
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
    let user: UserModel = UserModel(name: "Harrison", email: "harrison@gmail.com", isLoggedIn: true)
    PouchView(pouch: user.pouch)
        .environmentObject(marketDataController)
}
