//
//  PropertyDetailsView.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 6/3/24.
//

import SwiftUI

struct PropertyDetailsView: View {
    @EnvironmentObject private var propertiesEnv: PropertiesEnvironment
    
    var body: some View {
        if let property = propertiesEnv.property {
            ScrollView {
                VStack(spacing: 24) {
                    CarouselView(images: property.images)

                    PropertyDataCardView()
                    
                    ContractView(viewModel: ContractViewModel(propertyId: property._id))
                    
                    PropertyRentabilityView()
                    
                    DeletePropertyView(viewModel: DeletePropertyViewModel(propertiesEnv: propertiesEnv))
                        .padding()
                }
            }
            .navigationDestination(isPresented: $propertiesEnv.isEditingProperty) {
                PropertyFormView(viewModel: PropertyFormViewModel(propertiesEnv: propertiesEnv))
                    .navigationTitle("Edit Property")
            }
        }
    }
}

#Preview {
    PropertyDetailsView()
        .environmentObject(PropertiesEnvironment())
}
