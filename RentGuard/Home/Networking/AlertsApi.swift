//
//  AlertsApi.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 1/3/24.
//

import Foundation

enum AlertListType: String {
    case today = "today"
    case next = "next"
}

@MainActor
final class AlertsApi: NetworkManager {
    static let path = "alerts/"
    
    static func getAlerts(type: AlertListType) async throws -> [UserAlert] {
        let url = path
        let data = try await AlertsApi.makeRequest(urlPath: url,
                                                   query: [URLQueryItem(name: "type", value: type.rawValue)],
                                                   withAuth: true)
        return try NetworkManager.decodeResponse(data, returnType: [UserAlert].self)
    }
}
