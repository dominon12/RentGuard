//
//  ContractView.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 9/3/24.
//

import SwiftUI

struct ContractView: View {
    @EnvironmentObject private var propertiesEnv: PropertiesEnvironment
    @EnvironmentObject private var contractEnv: ContractEnvironment
    
    var body: some View {
        ZStack {
            if contractEnv.contract != nil {
                ContractCardView(viewModel: ContractCardViewModel(contractEnv: contractEnv))
            } else {
                AddContractView()
                    .padding(.horizontal)
            }
        }
        .navigationDestination(isPresented: $contractEnv.isCreatingContract) {
            ContractFormView(viewModel:
                                ContractFormViewModel(propertyId: propertiesEnv.property?._id ?? "",
                                                      contractEnv: contractEnv))
                .navigationTitle("Add Contract")
        }
        .task {
            if let id = propertiesEnv.property?._id {
                await contractEnv.getContract(propertyId: id)
            }
        }
    }
}

#Preview {
    ContractView()
        .environmentObject(ContractEnvironment())
}
