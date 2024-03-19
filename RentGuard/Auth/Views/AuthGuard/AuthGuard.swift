//
//  ContentView.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 27/2/24.
//

import SwiftUI

struct AuthGuard: View {
    @EnvironmentObject private var authManager: AuthManager
    @AppStorage(AuthManagerDefaults.accessToken) var accessToken: String?
    
    var body: some View {
        ZStack {
            if authManager.isAuthenticated && authManager.accessToken != nil {
                MainView()
            } else {
                AuthView()
            }
        }
        .onChange(of: accessToken) {
            authManager.checkAccessToken(accessToken)
        }
    }
}

#Preview {
    AuthGuard()
}
