//
//  PropertyDetailsView.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 6/3/24.
//

import SwiftUI

struct PropertyDetailsView: View {
    var property: Property
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 24) {
                    CarouselView(images: property.images)

                    PropertyDataCardView(property: property)
                    
                    if let tenant = property.tenant {
                        TenantCardView(tenant: tenant)
                    }
                    
                    PropertyRentabilityView()
                    
                    DeletePropertyView()
                        .padding()
                }
            }
            .navigationTitle(property.name)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    PropertyDetailsView(property: PropertyMockData.sampleProperty)
}
