//
//  DeletePropertyViewModel.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 7/3/24.
//

import SwiftUI

@MainActor
final class DeletePropertyViewModel: ObservableObject {
    let refetch: () async -> Void
    @Binding var property: Property?
    @Published var showConfirmation = false
    @Published var alert: AlertItem?
    
    init(refetch: @escaping () async -> Void, property: Binding<Property?>) {
        self.refetch = refetch
        self._property = property
    }
    
    func deleteProperty() async {
        if let id = property?._id {
            do {
                try await PropertiesApi.delete(id: id)
                await refetch()
                property = nil
            } catch {
                alert = PropertiesAlerts.deleteFailed
            }
        }
    }
}
