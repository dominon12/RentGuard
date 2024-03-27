//
//  HomeView.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 27/2/24.
//

import SwiftUI

@MainActor
struct HomeView: View {
    private let viewModel = HomeViewModel()
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack(alignment: .leading) {
                    Text("Hi, \(viewModel.user?.name ?? "")")
                        .font(.largeTitle)
                        .padding([.leading, .top])
                    
                    Text("Here's your summary")
                        .font(.title)
                        .padding([.bottom, .leading])
                    
                    PropsMapView()
                    
                    AlertsListView()
                }
            }
            
            if viewModel.isLoading {
                LoadingView()
            }
        }
        .task {
            await viewModel.getUser()
        }
    }
}

#Preview {
    HomeView()
}
