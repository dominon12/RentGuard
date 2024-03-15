//
//  InvoiceAlerts.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 15/3/24.
//

import SwiftUI

struct InvoiceAlerts {
    static let updateFailed = AlertItem(title: Text("Update failed"),
                                        message: Text("Couldn't update invoice. Please try again later."),
                                        dismissButton: .default(Text("OK")))
}
