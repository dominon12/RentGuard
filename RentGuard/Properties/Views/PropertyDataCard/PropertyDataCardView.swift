//
//  PropertyDataCardView.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 6/3/24.
//

import SwiftUI

struct PropertyDataCardView: View {
    @EnvironmentObject private var propertiesEnv: PropertiesEnvironment
    
    var body: some View {
        if let property = propertiesEnv.property {
            DataCardView(title: "Data",
                         data: [
                            ("Address", property.fullAddress),
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
        .environmentObject(PropertiesEnvironment())
}
