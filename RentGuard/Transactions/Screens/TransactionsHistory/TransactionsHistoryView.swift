//
//  TransactionsHistoryView.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 12/3/24.
//

import SwiftUI

@MainActor
struct TransactionsHistoryView: View {
    @EnvironmentObject private var propertiesEnv: PropertiesEnvironment
    @StateObject private var viewModel = TransactionsHistoryViewModel()
    
    var body: some View {
        ZStack {
            List {
                ForEach(viewModel.transactions, id: \._id) { transaction in
                    TransactionCellView(viewModel: TransactionCellViewModel(transaction: transaction))
                }
                .onDelete(perform: { indexSet in
                    Task {
                        await viewModel.deleteTransactions(at: indexSet, propertyId: propertiesEnv.property?._id ?? "")
                    }
                })
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
