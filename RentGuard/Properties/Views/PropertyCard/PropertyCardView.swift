//
//  PropertyCardView.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 4/3/24.
//

import SwiftUI

struct PropertyCardView: View {
    var property: Property
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(property.name)
                    .font(.title)
                    .fontWeight(.semibold)
                
                Text(property.address)
                    .font(.body)
                
                Spacer()
                
                Text(property.tenant?.name ?? "No tenant")
                    .font(.footnote)
            }
            .padding(.trailing)
            
            AsyncImage(url: URL(string: property.images.first ?? "")) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 164, height: 188)
                    .clipped()
            } placeholder: {
                Image("property-img-placeholder")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 164, height: 188)
            }
        }
        .frame(height: 188)
        .padding()
        .cornerRadius(12)
        .background(.white)
        .clipped()
        .shadow(radius: 2, x: 0, y: 2)
    }
}

#Preview {
    PropertyCardView(property: Property(_id: "",
                                        name: "My property",
                                        address: "Calle Remolcador 6, puerta 5",
                                        images: ["https://www.cpg.nz/Admin/img/products/residential-property.jpeg"],
                                        documents: [],
                                        tenant: User(_id: "",
                                                     email: "email@mail.com",
                                                     name: "Cristina Lopez",
                                                     role: .tenant)))
}
