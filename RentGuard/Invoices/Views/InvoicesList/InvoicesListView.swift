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
            invoice.wasPaid == viewModel.showPaid
        }
    }
    
    var body: some View {
        VStack {
            Picker("What kind of invoices do you want to see?",
                   selection: $viewModel.showPaid) {
                Text("Unpaid").tag(false)
                Text("Paid").tag(true)
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
                    .onDelete(perform: { indexSet in
                        Task {
                            await invoiceEnv.deleteInvoice(at: indexSet, contractId: contractEnv.contract?._id ?? "")
                        }
                    })
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    viewModel.isCreatingInvoice = true
                } label: {
                    Text("Add")
                }
            }
        }
        .sheet(isPresented: $viewModel.isCreatingInvoice, content: {
            InvoiceFormView(viewModel: InvoiceFormViewModel(invoiceEnv: invoiceEnv, showForm: $viewModel.isCreatingInvoice))
        })
        .task {
            await invoiceEnv.getInvoices(contractId: contractEnv.contract?._id ?? "")
        }
    }
}

#Preview {
    InvoicesListView()
        .environmentObject(ContractEnvironment())
        .environmentObject(InvoiceEnvironment())
}
