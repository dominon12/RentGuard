//
//  PropertyDetailsView.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 6/3/24.
//

import SwiftUI

struct PropertyDetailsView: View {
    @EnvironmentObject private var propertiesEnv: PropertiesEnvironment
    @StateObject private var contractEnv = ContractEnvironment()
    @StateObject private var transactionsEnv = TransactionsEnvironment()
    
    var body: some View {
        if let property = propertiesEnv.property {
            ScrollView {
                VStack(spacing: 24) {
                    CarouselView(images: property.images)
                        .padding(.top)

                    PropertyDataCardView()
                    
                    ContractView()
                        .environmentObject(contractEnv)
                    
                    PropertyRentabilityView()
                        .environmentObject(transactionsEnv)
                    
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
}
