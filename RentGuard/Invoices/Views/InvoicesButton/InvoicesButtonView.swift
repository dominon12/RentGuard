//
//  InvoicesButtonView.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 14/3/24.
//

import SwiftUI

struct InvoicesButtonView: View {
    var body: some View {
        NavigationLink(destination: InvoicesView().navigationTitle("Invoices")) {
            Label("View Invoices", systemImage: "tray")
                .frame(maxWidth: .infinity)
                .frame(height: 50)
                .background(.blue.opacity(0.15))
                .cornerRadius(12)
        }

    }
}

#Preview {
    InvoicesButtonView()
}
