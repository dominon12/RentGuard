//
//  ContractsAlerts.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 9/3/24.
//

import SwiftUI

struct ContractsAlerts {
    static let deleteFailed = AlertItem(title: Text("Delete failed"), 
                                        message: Text("Couldn't delete the contract. Try again later."),
                                        dismissButton: .default(Text("Ok")))
}
