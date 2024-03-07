//
//  PropertyFormViewModel.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 5/3/24.
//

import SwiftUI
import Observation

struct PropertyForm {
    var name = ""
    var address = ""
    var city = ""
    var postalCode = ""
    var country = ""
    var surface = ""
    var price = ""
    var registrationId = ""
    var images = [FormField()]
    var documents = [FormField()]
}

@MainActor
final class PropertyFormViewModel: ObservableObject {
    var title = ""
    @Binding var isActive: Bool
    @Published var form = PropertyForm()
    @Published var alert: AlertItem?
    @Published var isSaving = false
    
    init(property: Property? = nil, isActive: Binding<Bool>) {
        self.title = property != nil ? "Edit Property" : "Add Property"
        self._isActive = isActive
        
        if let property {
            form = PropertyForm(name: property.name,
                                address: property.address,
                                city: property.city ?? "",
                                postalCode: property.postalCode ?? "",
                                country: property.country ?? "",
                                surface: property.surface ?? "",
                                price: property.price ?? "",
                                registrationId: property.registrationId ?? "",
                                images: property.images.map({ imageUrl in FormField(id: UUID(), value: imageUrl)}),
                                documents: property.documents.map({ docUrl in FormField(id: UUID(), value: docUrl)}))
        }
    }
      
    var isValidForm: Bool {
        guard !form.name.isEmpty && !form.address.isEmpty else {
            alert = PropertiesAlerts.formInvalid
            return false
        }
        return true
    }
    
    func save() async {
        guard isValidForm else { return }
        
        let payload = CreatePropertyDto(name: form.name,
                                        address: form.address,
                                        images: form.images.map({ field in field.value }),
                                        documents: form.documents.map({ field in field.value }),
                                        city: form.city.isEmpty ? nil : form.city,
                                        postalCode: form.postalCode.isEmpty ? nil : form.postalCode,
                                        country: form.country.isEmpty ? nil : form.country,
                                        registrationId: form.registrationId.isEmpty ? nil : form.registrationId,
                                        surface: form.surface.isEmpty ? nil : form.surface,
                                        price: form.price.isEmpty ? nil : form.price)
        
        isSaving = true
        
        do {
            try await PropertiesApi.create(payload: payload)
            isActive = false
        } catch {
            alert = PropertiesAlerts.saveFailed
        }
        
        isSaving = false
    }
}
