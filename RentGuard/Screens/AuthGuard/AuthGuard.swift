//
//  ContentView.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 27/2/24.
//

import SwiftUI

struct AuthGuard: View {
    private var viewModel = AuthGuardViewModel()
    
    var body: some View {
        if viewModel.isAuthenticated {
            MainView()
        } else {
            AuthView()
        }
    }
}

#Preview {
    AuthGuard()
}
