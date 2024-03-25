//
//  PropertyDataFormView.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 5/3/24.
//

import SwiftUI

struct PropertyDataFormView: View {
    @Binding var form: PropertyForm
    
    var body: some View {
        Section(header: Text("Data")) {
            TextField("Name", text: $form.name)
            
            TextField("Address", text: $form.address.address)
                .textContentType(.fullStreetAddress)
            
            HStack {
                TextField("City", text: $form.address.city)
                    .textContentType(.addressCity)
                
                TextField("Postal code", text: $form.address.postalCode)
                    .textContentType(.postalCode)
            }
            
            TextField("Country", text: $form.address.country)
                .textContentType(.countryName)
            
            TextField("Surface", text: $form.surface)
            
            TextField("Price", text: $form.price)
                .keyboardType(.decimalPad)

            TextField("Registration Id", text: $form.registrationId)

        }
    }
}

#Preview {
    PropertyDataFormView(form: .constant(PropertyForm()))
}
