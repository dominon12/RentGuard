//
//  PropertyRentabilityView.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 6/3/24.
//

import SwiftUI

struct PropertyRentabilityView: View {
    @EnvironmentObject private var propertiesEnv: PropertiesEnvironment
    @EnvironmentObject private var transactionsEnv: TransactionsEnvironment
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Rentability")
                .font(.title2)
                .fontWeight(.semibold)
            
            RentabilityCardView()
                 .padding(.bottom, 10)
            
            AddTransactionView(viewModel: AddTransactionViewModel(propertyId: propertiesEnv.property?._id ?? "" ,
                                                                  transactionsEnv: transactionsEnv))
            
            TransactionsHistoryButtonView()
        }
        .padding()
    }
}

#Preview {
    PropertyRentabilityView()
        .environmentObject(PropertiesEnvironment())
        .environmentObject(TransactionsEnvironment())
}
