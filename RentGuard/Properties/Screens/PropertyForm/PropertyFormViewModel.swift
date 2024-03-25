//
//  PropertyFormViewModel.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 5/3/24.
//

import SwiftUI
import Observation

struct PropertyAddressForm {
    var address = ""
    var city = ""
    var postalCode = ""
    var country = ""
}

struct PropertyForm {
    var name = ""
    var address = PropertyAddressForm()
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
                                address: PropertyAddressForm(address: property.address.address,
                                                             city: property.address.city ?? "", 
                                                             postalCode: property.address.postalCode ?? "", 
                                                             country: property.address.country ?? ""),
                                surface: property.surface ?? "",
                                price: property.price ?? "",
                                registrationId: property.registrationId ?? "",
                                images: property.images.map({ imageUrl in FormField(id: UUID(), value: imageUrl)}),
                                documents: property.documents.map({ docUrl in FormField(id: UUID(), value: docUrl)}))
        }
    }
      
    var isValidForm: Bool {
        guard !form.name.isEmpty && !form.address.address.isEmpty else {
            alert = PropertiesAlerts.formInvalid
            return false
        }
        return true
    }
    
    func save() async {
        guard isValidForm else { return }
        
        let payload = SavePropertyDto(name: form.name,
                                      address: SaveAddressDto(address: form.address.address,                                         
                                                              city: form.address.city.isEmpty ? nil : form.address.city,
                                                              postalCode: form.address.postalCode.isEmpty ? nil : form.address.postalCode,
                                                              country: form.address.country.isEmpty ? nil : form.address.country),
                                        images: form.images.filter({ field in !field.value.isEmpty }).map({ field in field.value }),
                                        documents: form.documents.filter({ field in !field.value.isEmpty }).map({ field in field.value }),
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
