//
//  PropertiesView.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 27/2/24.
//

import SwiftUI

@MainActor
struct PropertiesView: View {
    private let viewModel = PropertiesViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                List {
                    ForEach(viewModel.properties, id: \._id) { property in
                        PropertyCardView(property: property)
                    }
                }
                .listStyle(.inset)
                
                if viewModel.properties.isEmpty {
                    EmptyState(imageName: "empty-box",
                               message: "There are no properties yet.")
                }
                
                if viewModel.isLoading {
                    LoadingView()
                }
            }
            .navigationTitle("Properties")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        
                    } label: {
                        Text("Add")
                    }
                }
            }
        }
        .task {
            await viewModel.getProperties()
        }
    }
}

#Preview {
    PropertiesView()
}
