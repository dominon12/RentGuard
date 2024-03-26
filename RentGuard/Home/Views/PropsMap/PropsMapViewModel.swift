//
//  PropsMapViewModel.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 26/3/24.
//

import Foundation

@MainActor
final class PropsMapViewModel: ObservableObject {
    @Published var locations = [PropertyLocation]()
    
    func getLocations() async {
        do {
            locations = try await PropertiesApi.getLocations()
        } catch {}
    }
}
