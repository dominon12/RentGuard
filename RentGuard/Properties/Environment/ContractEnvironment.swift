//
//  ContractEnvironment.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 9/3/24.
//

import SwiftUI

@MainActor
final class ContractEnvironment: ObservableObject {
    @Published var contract: Contract?
    
    func getContract(propertyId: String) async {
        do {
            contract = try await ContractsApi.getContract(propertyId: propertyId)
        } catch {
        }
    }
}
