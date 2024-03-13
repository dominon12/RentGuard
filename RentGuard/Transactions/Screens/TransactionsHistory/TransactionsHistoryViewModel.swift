//
//  TransactionsHistoryViewModel.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 12/3/24.
//

import SwiftUI

@MainActor
final class TransactionsHistoryViewModel: ObservableObject {
    @Published var transactions = [Transaction]()
    @Published var alert: AlertItem?
    
    func getTransactions(propertyId: String) async {
        do {
            transactions = try await TransactionsApi.getAll(propertyId: propertyId)
        } catch {
        }
    }
    
    func deleteTransactions(at indexSet: IndexSet, propertyId: String) async {
        do {
            for i in indexSet {
                let transaction = transactions[i]
                try await TransactionsApi.delete(id: transaction._id)
            }
            transactions.remove(atOffsets: indexSet)
        } catch {
            alert = TransactionsAlerts.deleteError
        }
    }
}
