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
                .fixedSize(horizontal: false, vertical: true)
                .padding()
            
            Button {
                authManager.login()
            } label: {
                Text("Authenticate")
            }
            .buttonStyle(.bordered)
            .controlSize(.large)
            .tint(.accentColor)
        }
    }
}

#Preview {
    AuthView()
        .environmentObject(AuthManager())
}
