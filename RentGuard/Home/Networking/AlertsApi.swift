//
//  AlertsApi.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 1/3/24.
//

import Foundation

@MainActor final class AlertsApi: NetworkManager {
    static let path = "alerts/"
    
    static func getAlerts() async throws -> [UserAlert] {
        let url = path
        return try await AlertsApi.requestWithAuth(urlPath: url, returnType: [UserAlert].self)
    }
}
