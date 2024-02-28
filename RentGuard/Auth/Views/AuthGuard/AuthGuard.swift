//
//  ContentView.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 27/2/24.
//

import SwiftUI

struct AuthGuard: View {
    @EnvironmentObject private var authManager: AuthManager
    
    var body: some View {
        if authManager.isAuthenticated {
            MainView()
        } else {
            AuthView()
        }
    }
}

#Preview {
    AuthGuard()
}
