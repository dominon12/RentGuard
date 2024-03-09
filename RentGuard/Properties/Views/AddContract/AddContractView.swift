//
//  AddTenant.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 7/3/24.
//

import SwiftUI

struct AddContractView: View {
    var body: some View {
        NavigationLink {
            ContractFormView()
                .navigationTitle("Add Contract")
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
}
