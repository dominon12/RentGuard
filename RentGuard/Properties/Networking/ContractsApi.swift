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
        return try await PropertiesApi.makeRequest(urlPath: url,
                                                   returnType: Contract.self,
                                                   withAuth: true)
    }
}
