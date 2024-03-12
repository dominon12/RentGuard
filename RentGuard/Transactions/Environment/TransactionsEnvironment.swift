//
//  TransactionsEnvironment.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 12/3/24.
//

import SwiftUI

@MainActor
final class TransactionsEnvironment: ObservableObject {
    @Published var balance: PropertyBalance?
    
    func getBalance(propertyId: String) async {
        do {
            balance = try await TransactionsApi.getBalance(propertyId: propertyId)
        } catch {
        }
    }
}
