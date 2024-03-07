//
//  PropertyDetailsView.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 6/3/24.
//

import SwiftUI

struct PropertyDetailsView: View {
    var property: Property
    @StateObject var viewModel = PropertyDetailsViewModel()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                CarouselView(images: property.images)

                PropertyDataCardView(property: property, isShowingForm: $viewModel.isShowingForm)
                
                if let tenant = property.tenant {
                    TenantCardView(tenant: tenant)
                }
                
                PropertyRentabilityView()
                
                DeletePropertyView()
                    .padding()
            }
        }
        .navigationDestination(isPresented: $viewModel.isShowingForm) {
            PropertyFormView(viewModel:
                                PropertyFormViewModel(property: property,
                                                      isActive: $viewModel.isShowingForm)).navigationTitle("Edit Property")
        }
    }
}

#Preview {
    PropertyDetailsView(property: PropertyMockData.sampleProperty)
}
