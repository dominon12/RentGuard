//
//  AccountView.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 27/2/24.
//

import SwiftUI
import Auth0

struct AccountView: View {
    var body: some View {
        NavigationStack {
            VStack {
                ProfileFormView()
                
//                Spacer()
                
                LogoutButtonView()
                    .padding(.bottom)
            }
            .navigationTitle("Profile")
        }
    }
}

#Preview {
    AccountView()
}
