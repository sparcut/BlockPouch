//
//  PouchView.swift
//  BlockPouch
//
//  Created by Harrison on 12/5/2025.
//

import Foundation
import SwiftUI
import SwiftData

struct PouchView: View {
    @EnvironmentObject private var marketDataController: MarketDataController
    @Binding var user: UserModel

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            PouchOverviewComponent(user: user)
                .environmentObject(marketDataController)

            List(Array(user.pouch.ownedAssets.enumerated()), id: \.element.id) { i, a in
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

//#Preview {
//    struct PreviewWrapper: View {
//        @State private var user = SampleDataFactory.makeUserModel()
//        
//        var test: Binding<AppUserModel> {
//            _ = $user
//        }
//        
//        
//        var body: some View {
//            PouchView(user: $user)
//                .environmentObject(MarketDataController(useAPI: false))
//        }
//    }
//    
//    return PreviewWrapper().modelContainer(for: [AppUserModel.self, PouchModel.self, OwnedAssetModel.self, TransactionModel.self])
//}
