//
//  PropertiesEnvironment.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 8/3/24.
//

import Foundation

@MainActor
final class PropertiesEnvironment: ObservableObject {
    @Published var properties = [Property]()
    @Published var isLoading = false
    @Published var isCreatingProperty = false
    @Published var isEditingProperty = false
    @Published var property: Property?
    
    func getProperties() async {
        isLoading = true
        do {
            properties = try await PropertiesApi.getProperties()
        } catch {
            print("Error fetching properties", error)
        }
        isLoading = false
    }
}
