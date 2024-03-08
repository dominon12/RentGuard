//
//  PropertyDataCardView.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 6/3/24.
//

import SwiftUI

struct PropertyDataCardView: View {
    @EnvironmentObject private var propertiesEnv: PropertiesEnvironment
    
    var address: String {
        if let property = propertiesEnv.property {
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
        return ""
    }
    
    var body: some View {
        if let property = propertiesEnv.property {
            DataCardView(title: "Data",
                         data: [
                            ("Address", address),
                            ("Surface", property.surface ?? "-"),
                            ("Registration Id", property.registrationId ?? "-"),
                            ("Price", property.price ?? "-")
                         ],
                         documents: property.documents) {
                Button {
                    propertiesEnv.isEditingProperty = true
                } label: {
                    Text("Edit")
                }
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    PropertyDataCardView()
}
