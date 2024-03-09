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
                                        dismissButton: .default(Text("OK")))
    
    static let formInvalid = AlertItem(title: Text("Form is invalid"), 
                                       message: Text("Make sure form is filled correctly"),
                                       dismissButton: .default(Text("OK")))
    
    static let saveFailed = AlertItem(title: Text("Couldn't save"),
                                      message: Text("Make sure the form is filled correctly and try again"),
                                      dismissButton: .default(Text("OK")))
}
