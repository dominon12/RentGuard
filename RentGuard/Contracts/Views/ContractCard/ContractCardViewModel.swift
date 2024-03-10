//
//  ContractCardViewModel.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 9/3/24.
//

import SwiftUI

@MainActor
final class ContractCardViewModel: ObservableObject {
    let contractEnv: ContractEnvironment
    @Published var isDeleting = false
    @Published var alert: AlertItem?
    
    init(contractEnv: ContractEnvironment) {
        self.contractEnv = contractEnv
    }
    
    func deleteContract() async {
        if let contract = contractEnv.contract {
            do {
                try await ContractsApi.delete(id: contract._id)
                contractEnv.contract = nil
            } catch {
                alert = ContractsAlerts.deleteFailed
            }
        }
    }
}
