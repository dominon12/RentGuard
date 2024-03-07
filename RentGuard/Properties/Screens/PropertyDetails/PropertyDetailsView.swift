//
//  PropertyDetailsView.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 6/3/24.
//

import SwiftUI

struct PropertyDetailsView: View {
    @ObservedObject var viewModel: PropertyDetailsViewModel
    
    var body: some View {
        if let property = viewModel.property {
            ScrollView {
                VStack(spacing: 24) {
                    CarouselView(images: property.images)

                    PropertyDataCardView(property: property, isShowingForm: $viewModel.isShowingForm)
                    
                    if let tenant = property.tenant {
                        TenantCardView(tenant: tenant)
                    } else {
                        AddTenantView()
                            .padding(.horizontal)
                    }
                    
                    PropertyRentabilityView()
                    
                    DeletePropertyView(viewModel: DeletePropertyViewModel(refetch: viewModel.refetch,
                                                                          property: $viewModel.property))
                        .padding()
                }
            }
            .navigationDestination(isPresented: $viewModel.isShowingForm) {
                PropertyFormView(viewModel:
                                    PropertyFormViewModel(property: viewModel.property,
                                                          refetch: viewModel.refetch,
                                                          isActive: $viewModel.isShowingForm)).navigationTitle("Edit Property")
            }
        }
    }
}

#Preview {
    PropertyDetailsView(viewModel:
                            PropertyDetailsViewModel(refetch: {},
                                                     property: .constant(PropertyMockData.sampleProperty)))
}
