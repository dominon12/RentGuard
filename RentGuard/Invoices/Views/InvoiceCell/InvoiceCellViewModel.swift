//
//  InvoiceCellViewModel.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 14/3/24.
//

import Foundation

@MainActor
final class InvoiceCellViewModel: ObservableObject {
    let invoice: Invoice
    let invoiceEnv: InvoiceEnvironment
    
    var invoiceConcept: String {
        if invoice.type == .other, let description = invoice.description {
            return description
        }
        return invoice.type.rawValue
    }
    
    var invoiceAction: String {
        invoice.wasPaid ? "Mark Unpaid" : "Mark Paid"
    }
    
    init(invoice: Invoice, invoiceEnv: InvoiceEnvironment) {
        self.invoice = invoice
        self.invoiceEnv = invoiceEnv
    }
    
    func togglePaidStatus(contractId: String) async {
        let payload = UpdateInvoiceDto(wasPaid: !invoice.wasPaid)
        await invoiceEnv.updateInvoice(id: invoice._id, contractId: contractId, payload: payload)
    }
}
