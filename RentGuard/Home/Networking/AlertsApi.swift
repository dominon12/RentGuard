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
        return try await AlertsApi.requestWithAuth(urlPath: url, 
                                                   returnType: [UserAlert].self,
                                                   query: [URLQueryItem(name: "type", value: type.rawValue)])
    }
}
