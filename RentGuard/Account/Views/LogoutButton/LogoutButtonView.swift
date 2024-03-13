//
//  LogoutButton.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 13/3/24.
//

import SwiftUI

struct LogoutButtonView: View {
    @EnvironmentObject private var authManager: AuthManager
    
    var body: some View {
        Button {
            authManager.logout()
        } label: {
            Text("Log out")
        }
        .foregroundColor(.red)
    }
}

#Preview {
    LogoutButtonView()
        .environmentObject(AuthManager())
}
