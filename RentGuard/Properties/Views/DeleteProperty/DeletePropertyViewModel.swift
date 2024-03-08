//
//  DeletePropertyViewModel.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 7/3/24.
//

import SwiftUI

@MainActor
final class DeletePropertyViewModel: ObservableObject {
    private let propertiesEnv: PropertiesEnvironment
    @Published var showConfirmation = false
    @Published var alert: AlertItem?
    
    init(propertiesEnv: PropertiesEnvironment) {
        self.propertiesEnv = propertiesEnv
    }
    
    func deleteProperty() async {
        if let id = propertiesEnv.property?._id {
            do {
                try await PropertiesApi.delete(id: id)
                await propertiesEnv.getProperties()
                propertiesEnv.property = nil
            } catch {
                alert = PropertiesAlerts.deleteFailed
            }
        }
    }
}
