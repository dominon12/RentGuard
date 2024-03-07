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
        return try await PropertiesApi.makeRequest(urlPath: url,
                                                   returnType: [Property].self,
                                                   withAuth: true)
    }
    
    static func create(payload: SavePropertyDto) async throws {
        let url = path
        try await PropertiesApi.makeRequest(urlPath: url,
                                            returnType: Property.self,
                                            payload: payload,
                                            withAuth: true,
                                            method: "POST")
    }
    
    static func update(id: String, payload: SavePropertyDto) async throws {
        let url = path + id
        try await PropertiesApi.makeRequest(urlPath: url,
                                            returnType: Property.self,
                                            payload: payload,
                                            withAuth: true,
                                            method: "PATCH")
    }
    
    static func delete(id: String) async throws {
        let url = path + id
        try await PropertiesApi.makeRequest(urlPath: url, 
                                            returnType: Property.self,
                                            withAuth: true,
                                            method: "DELETE")
    }
}
