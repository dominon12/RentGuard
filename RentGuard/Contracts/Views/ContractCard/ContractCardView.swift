//
//  TenantCardView.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 6/3/24.
//

import SwiftUI

@MainActor
struct ContractCardView: View {
    @ObservedObject var viewModel: ContractCardViewModel
    
    var body: some View {
        if let contract = viewModel.contractEnv.contract {
            DataCardView(title: "Contract",
                         data: [
                            ("Name", contract.tenant.name),
                            ("Contract", "\(contract.from.formatted(date: .abbreviated, time: .omitted)) - \(contract.until.formatted(date: .abbreviated, time: .omitted))"),
                            ("Rent", "$\(contract.rent)"),
                            ("Deposit", "$\(contract.deposit)")
                         ],
                         documents: contract.documents) {
                HStack(spacing: 24) {
                    Button {
                        viewModel.contractEnv.isShowingForm = true
                    } label: {
                        Text("Edit")
                    }
                    
                    Button {
                        viewModel.isDeleting = true
                    } label: {
                        Text("Delete")
                    }
                    .foregroundColor(.red)
                }
            }
            .padding(.horizontal)
            .confirmationDialog("Are you sure you want to delete this contract?",
                                isPresented: $viewModel.isDeleting,
                                titleVisibility: .visible) {
                Button("Yes, delete", role: .destructive) {
                    Task {
                        await viewModel.deleteContract()
                    }
                }
            } message: {
                Text("Proceed with caution! This action is permanent and cannot be reverted.")
            }
            .alert(item: $viewModel.alert) { alert in
                Alert(title: alert.title,
                      message: alert.message,
                      dismissButton: alert.dismissButton)
            }
        }
    }
}

#Preview {
    ContractCardView(viewModel: ContractCardViewModel(contractEnv: ContractEnvironment()))
}
