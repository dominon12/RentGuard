//
//  PropertiesViewModel.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 4/3/24.
//

import Foundation
import Observation

@MainActor
@Observable
final class PropertiesViewModel {
    var properties = [Property]()
    var isLoading = false
    
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
