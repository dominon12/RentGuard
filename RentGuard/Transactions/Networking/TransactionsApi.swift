//
//  TransactionsApi.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 12/3/24.
//

import Foundation

@MainActor
final class TransactionsApi: NetworkManager {
    static let path = "transactions/"
    
    static func getBalance(propertyId: String) async throws -> PropertyBalance {
        let url = path + "by-property/" + propertyId + "/balance"
        let data = try await NetworkManager.makeRequest(urlPath: url, withAuth: true)
        return try NetworkManager.decodeResponse(data, returnType: PropertyBalance.self)
    }
    
    static func create(payload: CreateTransactionDto) async throws {
        let url = path
        let _ = try await NetworkManager.makeRequest(urlPath: url, 
                                                     payload: payload,
                                                     withAuth: true,
                                                     method: "POST")
    }
    
    static func getAll(propertyId: String) async throws -> [Transaction] {
        let url = path + "by-property/" + propertyId
        let data = try await NetworkManager.makeRequest(urlPath: url, withAuth: true)
        return try NetworkManager.decodeResponse(data, returnType: [Transaction].self)
    }
    
    static func delete(id: String) async throws {
        let url = path + id
        let _ = try await NetworkManager.makeRequest(urlPath: url, withAuth: true, method: "DELETE")
    }
}
