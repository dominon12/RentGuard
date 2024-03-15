//
//  InvoicesView.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 14/3/24.
//

import SwiftUI

struct InvoicesView: View {
    @EnvironmentObject private var invoiceEnv: InvoiceEnvironment
    
    var body: some View {
        InvoicesListView()
            .alert(item: $invoiceEnv.alert) { alert in
                Alert(title: alert.title,
                      message: alert.message,
                      dismissButton: alert.dismissButton)
            }
    }
}

#Preview {
    InvoicesView()
        .environmentObject(InvoiceEnvironment())
}
