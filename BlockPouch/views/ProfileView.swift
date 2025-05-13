//
//  ProfileView.swift
//  BlockPouch
//
//  Created by Harrison on 12/5/2025.
//

import Foundation
import SwiftUI

struct ProfileView: View {
    @Binding var user: UserModel
    
    var body: some View {
        VStack(alignment: .leading) {
            StackRounded(direction: StackDirection.vertical, spacing: 20) {
                HStack() {
                    VStack(alignment: .leading) {
                        Text(user.name)
                            .font(.title.bold())
                        Text(user.email)
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                    Spacer()
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100)
                        .foregroundStyle(.blue)
                }
                .padding()
                
                Divider()
                
                ActionButton(
                    title: "Logout",
                    icon: "arrow.backward.circle",
                    foregroundColor: .red,
                    backgroundColor: .red.opacity(0.3)
                ) {
                    user.isLoggedIn = false
                }
            }
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.systemGroupedBackground))
    }
}
