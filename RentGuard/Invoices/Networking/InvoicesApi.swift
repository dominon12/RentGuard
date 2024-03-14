//
//  InvoicesApi.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 14/3/24.
//

import Foundation

class InvoicesApi: NetworkManager {
    static let path = "invoices/"
    
    static func create(_ payload: CreateInvoiceDto) async throws {
        let url = InvoicesApi.path
        let _ = try await NetworkManager.makeRequest(urlPath: url, payload: payload, method: "POST")
    }
    
    static func update(id: String, payload: UpdateInvoiceDto) async throws {
        let url = InvoicesApi.path + id
        let _ = try await NetworkManager.makeRequest(urlPath: url, payload: payload, withAuth: true, method: "PATCH")
    }
    
    static func getAll(contractId: String) async throws -> [Invoice] {
        let url = InvoicesApi.path + "by-contract/" + contractId
        let data = try await NetworkManager.makeRequest(urlPath: url, withAuth: true)
        return try NetworkManager.decodeResponse(data, returnType: [Invoice].self)
    }
}
