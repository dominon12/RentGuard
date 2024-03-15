//
//  InvoiceCellView.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 14/3/24.
//

import SwiftUI

@MainActor
struct InvoiceCellView: View {
    @ObservedObject var viewModel: InvoiceCellViewModel
    @EnvironmentObject private var contractEnv: ContractEnvironment
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Invoice for \(viewModel.invoiceConcept)")
                    .font(.title2)
                    .padding(.bottom, 2)
                
                HStack {
                    Text("Amount:")
                        .bold()
                    
                    Text("\(String(format: "%.2f", viewModel.invoice.amount))$")
                }
                
                HStack {
                    Text("Due date:")
                        .bold()
                    
                    Text(viewModel.invoice.dueDate.formatted(date: .abbreviated, time: .omitted))
                }
            }
            
            Spacer()
                
            Button {
                Task {
                    await viewModel.togglePaidStatus(contractId: contractEnv.contract?._id ?? "")
                }
            } label: {
                Text(viewModel.invoiceAction)
            }
        }
    }
}

#Preview {
    InvoiceCellView(viewModel: InvoiceCellViewModel(invoice: InvoiceMockData.sampleInvoice, invoiceEnv: InvoiceEnvironment()))
}
