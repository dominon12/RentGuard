//
//  PropertiesView.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 27/2/24.
//

import SwiftUI

@MainActor
struct PropertiesView: View {
    @EnvironmentObject private var propertiesEnv: PropertiesEnvironment
    
    var body: some View {
        NavigationStack {
            ZStack {
                List(propertiesEnv.properties) { property in
                    PropertyCardView(property: property)
                        .contentShape(Rectangle())
                        .onTapGesture {
                            propertiesEnv.property = property
                        }
                }
                .listStyle(.inset)
                
                if propertiesEnv.properties.isEmpty {
                    EmptyState(imageName: "empty-box",
                               message: "There are no properties yet.")
                }
            }
            .navigationTitle("Properties")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        propertiesEnv.isCreatingProperty = true
                    } label: {
                        Text("Add")
                    }
                }
            }
            .navigationDestination(isPresented: $propertiesEnv.isCreatingProperty) {
                PropertyFormView(viewModel: PropertyFormViewModel(propertiesEnv: propertiesEnv))
                    .navigationTitle("Add Property")
            }
            .navigationDestination(item: $propertiesEnv.property) { property in
                PropertyDetailsView()
                    .navigationTitle(property.name)
            }
        }
        .task {
            await propertiesEnv.getProperties()
        }
    }
}

#Preview {
    PropertiesView()
        .environmentObject(PropertiesEnvironment())
}
