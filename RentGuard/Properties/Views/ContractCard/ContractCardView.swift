//
//  TenantCardView.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 6/3/24.
//

import SwiftUI

struct ContractCardView: View {
    let contract: Contract
    
    var body: some View {
        DataCardView(title: "Contract",
                     data: [
                        ("Name", contract.tenant.name),
                        ("Contract", "\(contract.from.formatted(date: .abbreviated, time: .omitted)) - \(contract.until.formatted(date: .abbreviated, time: .omitted))"),
                        ("Rent", "$\(contract.rent)"),
                        ("Deposit", "$\(contract.deposit ?? 0)")
                     ],
                     documents: contract.documents) {
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
    ContractCardView(contract: ContractMockData.sampleContract)
}
