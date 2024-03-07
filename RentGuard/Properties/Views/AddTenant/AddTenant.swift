//
//  AddTenant.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 7/3/24.
//

import SwiftUI

struct AddTenantView: View {
    var body: some View {
        NavigationLink {
            TenantFormView()
                .navigationTitle("Add Tenant")
        } label: {
            Label("Add Tenant", systemImage: "person.badge.plus")
                .frame(maxWidth: .infinity)
                .frame(height: 50)
                .background(.blue)
                .foregroundColor(.white)
                .cornerRadius(12)
        }
    }
}

#Preview {
    AddTenantView()
}
