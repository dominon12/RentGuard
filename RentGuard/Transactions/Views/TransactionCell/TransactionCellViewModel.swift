//
//  TransactionCellViewModel.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 12/3/24.
//

import SwiftUI

final class TransactionCellViewModel: ObservableObject {
    var transaction: Transaction
    
    var symbol: String {
        switch transaction.type {
        case .credit:
            "+"
        case .debit:
            "-"
        }
    }
    
    var color: Color {
        switch transaction.type {
        case .credit:
            .green
        case .debit:
            .red
        }
    }
    
    init(transaction: Transaction) {
        self.transaction = transaction
    }
}
