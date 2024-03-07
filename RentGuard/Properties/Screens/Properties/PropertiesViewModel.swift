//
//  PropertiesViewModel.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 4/3/24.
//

import Foundation
import Observation

@MainActor
final class PropertiesViewModel: ObservableObject {
    @Published var properties = [Property]()
    @Published var isLoading = false
    @Published var isShowingForm = false
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
