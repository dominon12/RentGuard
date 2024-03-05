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
}
