//
//  PropertiesAlerts.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 5/3/24.
//

import SwiftUI

struct PropertiesAlerts {
    static let formInvalid = AlertItem(title: Text("Form is invalid"),
                                       message: Text("Make sure you've filled name and address fields"),
                                       dismissButton: .default(Text("OK")))
    
    static let saveFailed = AlertItem(title: Text("Couldn't save"),
                                      message: Text("Something went wrong trying to save the form. Please try again later."),
                                      dismissButton: .default(Text("OK")))
}
