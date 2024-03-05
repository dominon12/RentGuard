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

final class PropertyFormViewModel: ObservableObject {
    var property: Property?
    @Binding var isActive: Bool
    @Published var form = PropertyForm()
    @Published var alert: AlertItem?
    
    init(property: Property? = nil, isActive: Binding<Bool>) {
        self.property = property
        self._isActive = isActive
    }
    
    var title: String {
        if property != nil {
            return "Edit Property"
        }
        return "Add Property"
    }
    
    var isValidForm: Bool {
        guard !form.name.isEmpty && !form.address.isEmpty else {
            alert = PropertiesAlerts.formInvalid
            return false
        }
        return true
    }
    
    func save() {
        guard isValidForm else { return }
        
        isActive = false
    }
}
