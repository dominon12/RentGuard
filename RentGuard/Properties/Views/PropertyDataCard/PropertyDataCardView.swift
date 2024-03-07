//
//  PropertyDataCardView.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 6/3/24.
//

import SwiftUI

struct PropertyDataCardView: View {
    let property: Property
    @Binding var isShowingForm: Bool
    
    var address: String {
        var address = property.address
        if let city = property.city {
            address += ", " + city
        }
        if let postalCode = property.postalCode {
            address += ", " + postalCode
        }
        if let country = property.country {
            address += ", " + country
        }
        return address
    }
    
    var body: some View {
        DataCardView(title: "Data",
                     data: [
                        ("Address", address),
                        ("Surface", property.surface ?? "-"),
                        ("Registration Id", property.registrationId ?? "-"),
                        ("Price", property.price ?? "-")
                     ],
                     documents: property.documents) {
            Button {
                isShowingForm = true
            } label: {
                Text("Edit")
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    PropertyDataCardView(property: PropertyMockData.sampleProperty, isShowingForm: .constant(false))
}
