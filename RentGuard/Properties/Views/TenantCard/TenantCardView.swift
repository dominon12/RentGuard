//
//  TenantCardView.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 6/3/24.
//

import SwiftUI

struct TenantCardView: View {
    let tenant: User
    
    var body: some View {
        DataCardView(title: "Tenant",
                     data: [
                        ("Name", tenant.name),
                        ("Contract", "01.09.2022 - 01.09.2024"),
                        ("Rent", "300$"),
                        ("Deposit", "300$")
                     ],
                     documents: []) {
            HStack(spacing: 24) {
                Button {
                    
                } label: {
                    Text("Edit")
                }
                
                Button {
                    
                } label: {
                    Text("Delete")
                }
                .foregroundColor(.red)
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    TenantCardView(tenant: PropertyMockData.sampleProperty.tenant!)
}
