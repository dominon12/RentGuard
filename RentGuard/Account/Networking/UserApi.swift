//
//  UserApi.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 28/2/24.
//

import Foundation

class UserApi: NetworkManager {
    static let path = "users/"
    
    static func create(_ payload: CreateUserDto) async throws {
        let url = UserApi.path
        let _ = try await NetworkManager.makeRequest(urlPath: url, payload: payload, method: "POST")
    }
    
    static func current() async throws -> User {
        let url = UserApi.path + "current"
        let data = try await NetworkManager.makeRequest(urlPath: url, withAuth: true)
        return try NetworkManager.decodeResponse(data, returnType: User.self)
    }
}
