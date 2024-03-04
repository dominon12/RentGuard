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
        return try await PropertiesApi.requestWithAuth(urlPath: url,
                                                       returnType: [Property].self)
    }
}
