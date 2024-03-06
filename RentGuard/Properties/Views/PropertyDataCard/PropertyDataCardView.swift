//
//  PropertyDataCardView.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 6/3/24.
//

import SwiftUI

struct PropertyDataCardView: View {
    let property: Property
    
    var body: some View {
        DataCardView(title: "Data",
                     data: [
                        ("Address", property.address),
                        ("Surface", property.surface ?? "-"),
                        ("Registration Id", property.registrationId ?? "-"),
                        ("Price", property.price ?? "-")
                     ],
                     documents: property.documents) {
            Button {
                
            } label: {
                Text("Edit")
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    PropertyDataCardView(property: PropertyMockData.sampleProperty)
}
