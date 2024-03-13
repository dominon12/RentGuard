//
//  ProfileFormViewModel.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 13/3/24.
//

import SwiftUI

@MainActor
final class ProfileFormViewModel: ObservableObject {
    @Published var user: User?
    @Published var form = UpdateProfileDto(name: "")
    @Published var alert: AlertItem?
    @Published var isSaving = false
    
    var isValidForm: Bool {
        guard !form.name.isEmpty else {
            alert = AccountAlerts.formInvalid
            return false
        }
        return true
    }
    
    func loadUser() async {
        do {
            user = try await AccountApi.current()
            form.name = user?.name ?? ""
        } catch {
            alert = AccountAlerts.userLoadFailed
        }
    }
    
    func saveProfile() async {
        guard isValidForm else { return }
        
        isSaving = true
        
        do {
            try await AccountApi.update(payload: form)
        } catch {
            alert = AccountAlerts.updateFailed
        }
        
        isSaving = false
    }
}
