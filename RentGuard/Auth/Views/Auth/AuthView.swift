//
//  AuthView.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 27/2/24.
//

import SwiftUI
import Auth0

struct AuthView: View {
    @EnvironmentObject private var authManager: AuthManager
    
    var body: some View {
        VStack {
            Text("Welcome \nto Rent Guard")
                .font(.largeTitle)
                .multilineTextAlignment(.center)
            
            Text("Please authenticate to start using the app.")
                .font(.title2)
                .multilineTextAlignment(.center)
                .padding()
            
            Button {
                login()
            } label: {
                Text("Authenticate")
            }
            .buttonStyle(.bordered)
            .controlSize(.large)
            .tint(.accentColor)
        }
    }
}

extension AuthView {
    private func login() {
        Auth0
            .webAuth()
            .scope("openid profile email offline_access")
            .start { result in
                switch result {
                case .success(let credentials):
                    // todo: create user in db
                    print("Success: \(credentials)")
                    let credentialsManager = CredentialsManager(authentication: Auth0.authentication())
                    let isStored = credentialsManager.store(credentials: credentials)
                    print("Is stored: \(isStored)")
                    if isStored {
                        authManager.isAuthenticated = true
                    }
                case .failure(let error):
                    // todo: show alert
                    print("Failed with: \(error)")
                }
            }
    }
}

#Preview {
    AuthView()
}
