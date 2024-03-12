//
//  RentabilityCardView.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 12/3/24.
//

import SwiftUI

struct RentabilityCardView: View {
    @EnvironmentObject private var propertiesEnv: PropertiesEnvironment
    @EnvironmentObject private var transactionsEnv: TransactionsEnvironment
    
    var body: some View {
        DataCardView(title: nil,
                     data: [
                        ("Rent", "\(transactionsEnv.balance?.income ?? 0)$"),
                        ("Spent", "\(transactionsEnv.balance?.spent ?? 0)$"),
                        ("Rentability", "\(transactionsEnv.balance?.total ?? 0)$"),
                     ],
                     documents: []) {
            Text("")
                .hidden()
        }
         .task {
             await transactionsEnv.getBalance(propertyId: propertiesEnv.property?._id ?? "")
         }
    }
}

#Preview {
    RentabilityCardView()
        .environmentObject(PropertiesEnvironment())
        .environmentObject(TransactionsEnvironment())
}
