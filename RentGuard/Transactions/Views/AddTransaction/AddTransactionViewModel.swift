//
//  AddTransactionViewModel.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 12/3/24.
//

import SwiftUI

struct TransactionForm {
    var type: TransactionType = .credit
    var amount = ""
    var description = ""
    var date = Date()
}

@MainActor
final class AddTransactionViewModel: ObservableObject {
    var propertyId: String
    var transactionsEnv: TransactionsEnvironment
    @Published var isShowingForm = false
    @Published var form = TransactionForm()
    @Published var errorDetails: String?
    
    init(propertyId: String, transactionsEnv: TransactionsEnvironment) {
        self.propertyId = propertyId
        self.transactionsEnv = transactionsEnv
    }
    
    func startCreatingTransaction(type: TransactionType) {
        form.type = type
        isShowingForm = true
        errorDetails = nil
    }
    
    var isValidForm: Bool {
        guard Float(form.amount) != nil else {
            errorDetails = "Form is invalid. Make sure to fill the amount correctly."
            return false
        }
        return true
    }
    
    func saveTransaction() async {
        guard isValidForm else { return }
        
        let payload = CreateTransactionDto(property: propertyId,
                                           type: form.type,
                                           amount: Float(form.amount) ?? 0,
                                           description: form.description)
        
        do {
            try await TransactionsApi.create(payload: payload)
            await transactionsEnv.getBalance(propertyId: propertyId)
            isShowingForm = false
        } catch {
            errorDetails = "Save failed. Please try again later."
        }
    }
}
