//
//  TransactionCellView.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 12/3/24.
//

import SwiftUI

struct TransactionCellView: View {
    @ObservedObject var viewModel: TransactionCellViewModel
    
    var body: some View {
        HStack(alignment: .top) {
            Text(viewModel.symbol)
                .font(.title)
                .foregroundColor(viewModel.color)
                .frame(width: 16)
            
            VStack(alignment: .leading) {
                Text(String(format: "%.2f", viewModel.transaction.amount) + "$")
                    .font(.body)
                    .padding(.bottom, 1)
                
                Text(viewModel.transaction.description ?? "-")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            .padding(.horizontal)
            
            Spacer()
            
            Text(viewModel.transaction.createdAt.formatted())
                .font(.footnote)
                .foregroundColor(.secondary)
        }
    }
}

#Preview {
    TransactionCellView(viewModel: TransactionCellViewModel(transaction: TransactionMockData.sampleTransaction))
}
