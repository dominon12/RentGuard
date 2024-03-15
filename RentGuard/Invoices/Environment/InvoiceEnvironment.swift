//
//  InvoiceEnvironment.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 15/3/24.
//

import Foundation

@MainActor
final class InvoiceEnvironment: ObservableObject {
    @Published var invoices = [Invoice]()
    @Published var alert: AlertItem?
    
    func getInvoices(contractId: String) async {
        do {
            invoices = try await InvoicesApi.getAll(contractId: contractId)
        } catch {}
    }
    
    func updateInvoice(id: String, contractId: String, payload: UpdateInvoiceDto) async {
        do {
            try await InvoicesApi.update(id: id, payload: payload)
            await getInvoices(contractId: contractId)
        } catch {
            alert = InvoiceAlerts.updateFailed
        }
    }
}
