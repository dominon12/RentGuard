//
//  AccountAlerts.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 13/3/24.
//

import SwiftUI

struct AccountAlerts {
    static let formInvalid = AlertItem(title: Text("Form is invalid"),
                                       message: Text("Make sure you filled the form correctly and try again."),
                                       dismissButton: .default(Text("OK")))
    
    static let userLoadFailed = AlertItem(title: Text("User loading failed"),
                                          message: Text("Please try again later."),
                                          dismissButton: .default(Text("OK")))
    
    static let updateFailed = AlertItem(title: Text("Couldn't update profile"),
                                        message: Text("Please try again later."),
                                        dismissButton: .default(Text("OK")))
}
