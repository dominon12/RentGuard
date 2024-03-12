//
//  TransactionsHistoryView.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 12/3/24.
//

import SwiftUI

struct TransactionsHistoryView: View {
    @EnvironmentObject private var propertiesEnv: PropertiesEnvironment
    @StateObject private var viewModel = TransactionsHistoryViewModel()
    
    var body: some View {
        ZStack {
            List(viewModel.transactions, id: \._id) { transaction in
                TransactionCellView(viewModel: TransactionCellViewModel(transaction: transaction))
            }
            
            if viewModel.transactions.isEmpty {
                EmptyState(imageName: "empty-box", message: "There are no transactions yet.")
            }
        }
        .task {
            await viewModel.getTransactions(propertyId: propertiesEnv.property?._id ?? "")
        }
    }
}

#Preview {
    TransactionsHistoryView()
        .environmentObject(PropertiesEnvironment())
}
