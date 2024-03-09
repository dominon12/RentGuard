//
//  ContractsApi.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 9/3/24.
//

import Foundation

@MainActor
final class ContractsApi: NetworkManager {
    static let path = "contracts/"
    
    static func getContract(propertyId: String) async throws -> Contract {
        let url = path + "by-property/" + propertyId
        let data = try await NetworkManager.makeRequest(urlPath: url, withAuth: true)
        return try NetworkManager.decodeResponse(data, returnType: Contract.self)
    }
    
    static func delete(id: String) async throws {
        let url = path + id
        let _ = try await NetworkManager.makeRequest(urlPath: url, withAuth: true, method: "DELETE")
    }
    
    static func create(payload: SaveContractDto) async throws {
        let url = path
        let _ = try await NetworkManager.makeRequest(urlPath: url, payload: payload, withAuth: true, method: "POST")
    }
    
    static func update(id: String, payload: SaveContractDto) async throws {
        let url = path + id
        let _ = try await NetworkManager.makeRequest(urlPath: url, payload: payload, withAuth: true, method: "PATCH")
    }
}
