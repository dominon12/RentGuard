//
//  HomeView.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 27/2/24.
//

import SwiftUI

@MainActor struct HomeView: View {
    private let viewModel = HomeViewModel()
    
    var body: some View {
        VStack {
            if viewModel.user != nil {
                Text("Hi, \(viewModel.user!.name)")
            }
        }
        .onAppear {
            viewModel.getUser()
        }
    }
}

#Preview {
    HomeView()
}
