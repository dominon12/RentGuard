//
//  InvoiceFormViewModel.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 15/3/24.
//

import SwiftUI

struct InvoiceForm {
    var type: InvoiceType = .rent
    var amount = ""
    var wasPaid = false
    var dueDate = Date()
    var description = ""
}

@MainActor
final class InvoiceFormViewModel: ObservableObject {
    let invoiceEnv: InvoiceEnvironment
    @Binding var showForm: Bool
    @Published var form = InvoiceForm()
    @Published var errorDetails: String?
    
    init(invoiceEnv: InvoiceEnvironment, showForm: Binding<Bool>) {
        self.invoiceEnv = invoiceEnv
        self._showForm = showForm
    }
    
    var isValidForm: Bool {
        guard Float(form.amount) != nil else {
            errorDetails = "Form is invalid. Make sure to fill it correctly."
            return false
        }
        return true
    }
    
    func saveForm(contractId: String) async {
        guard isValidForm else { return }
        
        let payload = CreateInvoiceDto(contract: contractId, 
                                       type: form.type,
                                       amount: Float(form.amount) ?? 0,
                                       dueDate: form.dueDate.ISO8601Format(),
                                       wasPaid: form.wasPaid,
                                       description: form.description)
        
        do {
            try await InvoicesApi.create(payload)
            showForm = false
            await invoiceEnv.getInvoices(contractId: contractId)
        } catch {
            errorDetails = "Saving failed. Please try again later."
        }
    }
}
