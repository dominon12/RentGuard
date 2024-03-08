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
    private let propertiesEnv: PropertiesEnvironment
    @Published var form = PropertyForm()
    @Published var alert: AlertItem?
    @Published var isSaving = false
    
    init(propertiesEnv: PropertiesEnvironment) {
        self.propertiesEnv = propertiesEnv
        
        if let property = propertiesEnv.property {
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
        
        let payload = SavePropertyDto(name: form.name,
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
            if let property = propertiesEnv.property {
                try await PropertiesApi.update(id: property._id, payload: payload)
                await propertiesEnv.getProperties()
                propertiesEnv.isEditingProperty = false
            } else {
                try await PropertiesApi.create(payload: payload)
                await propertiesEnv.getProperties()
                propertiesEnv.isCreatingProperty = false
            }
        } catch {
            alert = PropertiesAlerts.saveFailed
        }
        isSaving = false
    }
}
