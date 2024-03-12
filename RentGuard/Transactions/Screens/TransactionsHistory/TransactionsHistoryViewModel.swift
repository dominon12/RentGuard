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
    
    func getTransactions(propertyId: String) async {
        do {
            transactions = try await TransactionsApi.getAll(propertyId: propertyId)
        } catch {
        }
    }
}
