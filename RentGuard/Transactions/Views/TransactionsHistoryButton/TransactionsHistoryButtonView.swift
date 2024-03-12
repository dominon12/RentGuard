//
//  TransactionsHistoryButtonView.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 12/3/24.
//

import SwiftUI

struct TransactionsHistoryButtonView: View {
    var body: some View {
        NavigationLink(destination: TransactionsHistoryView().navigationTitle("Transactions")) {
            Label("View History", systemImage: "clock")
                .frame(maxWidth: .infinity)
                .frame(height: 50)
                .background(.blue.opacity(0.15))
                .cornerRadius(12)
        }
    }
}

#Preview {
    TransactionsHistoryButtonView()
}
