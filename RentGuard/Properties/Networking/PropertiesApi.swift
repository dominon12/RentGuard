//
//  PropertiesApi.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 4/3/24.
//

import Foundation

@MainActor
final class PropertiesApi: NetworkManager {
    static let path = "properties/"
    
    static func getProperties() async throws -> [Property] {
        let url = path
        let data = try await NetworkManager.makeRequest(urlPath: url, withAuth: true)
        return try NetworkManager.decodeResponse(data, returnType: [Property].self)
    }
    
    static func create(payload: SavePropertyDto) async throws {
        let url = path
        let _ = try await NetworkManager.makeRequest(urlPath: url, payload: payload, withAuth: true, method: "POST")
    }
    
    static func update(id: String, payload: SavePropertyDto) async throws {
        let url = path + id
        let _ = try await NetworkManager.makeRequest(urlPath: url, payload: payload, withAuth: true, method: "PATCH")
    }
    
    static func delete(id: String) async throws {
        let url = path + id
        let _ = try await NetworkManager.makeRequest(urlPath: url, withAuth: true, method: "DELETE")
    }
}
