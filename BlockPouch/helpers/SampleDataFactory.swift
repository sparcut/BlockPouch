//
//  SampleDataFactory.swift
//  BlockPouch
//
//  Created by Harrison on 13/5/2025.
//

import Foundation

struct SampleDataFactory {
    static func makeUserModel(isLoggedIn: Bool? = nil) -> UserModel {
        let isLoggedIn = isLoggedIn ?? false
        let userId = UUID()

        let pouch = PouchModel(
            userID: userId,
            ownedAssets: [
                OwnedAssetModel(
                    assetId: "BTC",
                    amount: 2.2,
                    transactions: [
                        TransactionModel(
                            assetId: "BTC",
                            type: TransactionType.Buy,
                            status: TransactionStatus.Completed,
                            quantity: 2.2,
                            price: 130000,
                            date: DateHelper.formatter.date(from: "2025/03/06 17:55")!
                        )
                    ]
                ),
                OwnedAssetModel(
                    assetId: "ETH",
                    amount: 10.82,
                    transactions: [
                        TransactionModel(
                            assetId: "ETH",
                            type: TransactionType.Buy,
                            status: TransactionStatus.Completed,
                            quantity: 10.82,
                            price: 24020,
                            date: DateHelper.formatter.date(from: "2025/03/12 08:20")!
                        )
                    ]
                )
            ],
            balance: 45.50
        )

        let user = UserModel(
            id: userId,
            name: "Harrison",
            email: "harrison@gmail.com",
            isLoggedIn: isLoggedIn,
            pouch: pouch
        )

        return user
    }
}
