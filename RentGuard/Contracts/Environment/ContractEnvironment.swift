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
    @Published var isShowingForm = false
    
    func getContract(propertyId: String) async {
        do {
            contract = try await ContractsApi.getContract(propertyId: propertyId)
        } catch {
        }
    }
}
