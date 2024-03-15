//
//  InvoicesListView.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 14/3/24.
//

import SwiftUI

struct InvoicesListView: View {
    @StateObject private var viewModel = InvoicesListViewModel()
    @EnvironmentObject private var invoiceEnv: InvoiceEnvironment
    @EnvironmentObject private var contractEnv: ContractEnvironment
    
    var filteredInvoices: [Invoice] {
        invoiceEnv.invoices.filter { invoice in
            switch viewModel.selectedTab {
            case .paid:
                invoice.wasPaid
            case .unpaid:
                !invoice.wasPaid
            }
        }
    }
    
    var body: some View {
        VStack {
            Picker("What kind of invoices do you want to see?",
                   selection: $viewModel.selectedTab) {
                Text("Unpaid").tag(InvoiceListType.unpaid)
                
                Text("Paid").tag(InvoiceListType.paid)
            }
           .pickerStyle(.segmented)
           .padding()
            
            if filteredInvoices.isEmpty {
                EmptyState(imageName: "empty-box", message: "There are no invoices.")
            } else {
                List {
                    ForEach(filteredInvoices, id: \._id) { invoice in
                        InvoiceCellView(viewModel: InvoiceCellViewModel(invoice: invoice, invoiceEnv: invoiceEnv))
                    }
                }
            }
        }
        .task {
            await invoiceEnv.getInvoices(contractId: contractEnv.contract?._id ?? "")
        }
    }
}

#Preview {
    InvoicesListView()
        .environmentObject(ContractEnvironment())
}
