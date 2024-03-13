//
//  TransactionsAlerts.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 12/3/24.
//

import SwiftUI

struct TransactionsAlerts {
    static let deleteError = AlertItem(title: Text("Deletion failed"), 
                                       message: Text("Couldn't delete transaction. Please try again later."),
                                       dismissButton: .default(Text("OK")))
}
