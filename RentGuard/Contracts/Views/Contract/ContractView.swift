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
                VStack {
                    ContractCardView(viewModel: ContractCardViewModel(contractEnv: contractEnv))
                    
                    InvoicesButtonView()
                        .padding()
                }
            } else {
                AddContractView()
                    .padding(.horizontal)
            }
        }
        .navigationDestination(isPresented: $contractEnv.isShowingForm) {
            ContractFormView(viewModel:
                                ContractFormViewModel(propertyId: propertiesEnv.property?._id ?? "",
                                                      contractEnv: contractEnv))
                .navigationTitle(contractEnv.contract != nil ? "Edit Contract" : "Add Contract")
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
