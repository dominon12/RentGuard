//
//  PropertiesView.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 27/2/24.
//

import SwiftUI

@MainActor
struct PropertiesView: View {
    @StateObject private var viewModel = PropertiesViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                List {
                    ForEach(viewModel.properties, id: \._id) { property in
                        NavigationLink(destination: {
                            PropertyDetailsView(property: property)
                        }, label: {
                            PropertyCardView(property: property)
                        })
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
                        viewModel.isShowingForm = true
                    } label: {
                        Text("Add")
                    }
                }
            }
            .navigationDestination(isPresented: $viewModel.isShowingForm) {
                PropertyFormView(
                    viewModel: PropertyFormViewModel(
                        isActive: $viewModel.isShowingForm))
            }
        }
        .task(id: viewModel.isShowingForm, {
            if !viewModel.isShowingForm {
                await viewModel.getProperties()
            }
        })
    }
}

#Preview {
    PropertiesView()
}
