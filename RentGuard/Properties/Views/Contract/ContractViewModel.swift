//
//  ContractViewModel.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 9/3/24.
//

import SwiftUI

@MainActor
final class ContractViewModel: ObservableObject {
    let propertyId: String
    @Published var contract: Contract?
    @Published var isLoading = true
    
    init(propertyId: String) {
        self.propertyId = propertyId
    }
    
    func getContract() async {
        isLoading = true
        do {
            contract = try await ContractsApi.getContract(propertyId: propertyId)
        } catch {
        }
        isLoading = false
    }
}
