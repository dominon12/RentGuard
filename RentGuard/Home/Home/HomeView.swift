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
        VStack(alignment: .leading) {
            Text("Hi, \(viewModel.user?.name ?? "")")
                .font(.largeTitle)
                .padding(.leading)
            
            Text("Here's your summary")
                .font(.title)
                .padding([.bottom, .leading])
            
            Rectangle()
                .frame(width: .infinity, height: 250)
                .background(.black)
            
            AlertsList()
        }
        .task {
            await viewModel.getUser()
        }
    }
}

#Preview {
    HomeView()
}
