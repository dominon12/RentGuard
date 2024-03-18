//
//  AlertsApi.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 1/3/24.
//

import Foundation

@MainActor
final class AlertsApi: NetworkManager {
    static let path = "alerts/"
    
    static func getAlerts() async throws -> [UserAlert] {
        let url = path
        let data = try await AlertsApi.makeRequest(urlPath: url, withAuth: true)
        return try NetworkManager.decodeResponse(data, returnType: [UserAlert].self)
    }
}
