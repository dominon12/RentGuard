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
                List(viewModel.properties, id: \._id) { property in
                    Button {

                    } label: {
                        PropertyCardView(property: property)
                    }
                    .onTapGesture {
                        viewModel.property = property
                    }
                }
                .listStyle(.inset)
                
                if viewModel.properties.isEmpty {
                    EmptyState(imageName: "empty-box",
                               message: "There are no properties yet.")
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
                        refetch: viewModel.getProperties,
                        isActive: $viewModel.isShowingForm))
                    .navigationTitle("Add Property")
            }
            .navigationDestination(item: $viewModel.property) { property in
                    PropertyDetailsView(viewModel:
                                            PropertyDetailsViewModel(refetch: viewModel.getProperties,
                                                                     property: $viewModel.property))
                        .navigationTitle(property.name)
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
