//
//  NavigationController.swift
//  BubblePop
//
//  Created by Harrison on 17/4/2025.
//

import Foundation
import SwiftUI


/// Defines the routes for the NavigationConroller
///
/// - Author: Harrison Stirton
///
enum AppRoute: Hashable {
    case login
    case createAccount
    case main
    
    @ViewBuilder
    var destination: some View {
        switch(self) {
        case .login:
            LoginView()
        case .createAccount:
            CreateAccountView()
        case .main:
            MainView()
                .navigationBarBackButtonHidden(true)
        }
    }
}

/// Controls and stores the routing/navigation wthin the app
///
/// - Author: Harrison Stirton
///
class NavigationController: ObservableObject {
    @Published var path = NavigationPath()
    
    func navigate(to: AppRoute) {
        path.append(to)
    }
    
    func goBack() {
        if(!path.isEmpty) {
            path.removeLast()
        }
    }
    
    func goToRoot() {
        path = NavigationPath()
    }
}

