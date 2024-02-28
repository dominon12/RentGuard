//
//  AccountView.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 27/2/24.
//

import SwiftUI
import Auth0

struct AccountView: View {
    @EnvironmentObject private var authManager: AuthManager
    
    var body: some View {
        Button {
            logout()
        } label: {
            Text("Log out")
        }
    }
}

extension AccountView {
    private func logout() {
        Auth0
            .webAuth()
            .clearSession { result in
                switch result {
                case .success():
                    let credentialsManager = CredentialsManager(authentication: Auth0.authentication())
                    let didClear = credentialsManager.clear()
                    print("Did clear credentials: \(didClear)")
                    if didClear {
                        authManager.isAuthenticated = false
                    }
                case .failure(let error):
                    print("Couldn't log out: \(error)")
                }
            }
    }
}

#Preview {
    AccountView()
}
