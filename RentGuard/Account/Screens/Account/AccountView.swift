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
            authManager.logout()
        } label: {
            Text("Log out")
        }
    }
}

#Preview {
    AccountView()
}
