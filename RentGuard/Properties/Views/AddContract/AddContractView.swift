//
//  AddTenant.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 7/3/24.
//

import SwiftUI

struct AddContractView: View {
    @EnvironmentObject private var contractEnv: ContractEnvironment
    
    var body: some View {
        Button {
            contractEnv.isCreatingContract = true
        } label: {
            Label("Add Contract", systemImage: "person.badge.plus")
                .frame(maxWidth: .infinity)
                .frame(height: 50)
                .background(.blue)
                .foregroundColor(.white)
                .cornerRadius(12)
        }
    }
}

#Preview {
    AddContractView()
        .environmentObject(ContractEnvironment())
}
