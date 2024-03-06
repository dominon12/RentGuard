//
//  UserApi.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 28/2/24.
//

import Foundation

class UserApi: NetworkManager {
    static let path = "users/"
    
    static func create(_ payload: CreateUserDto) async throws -> User {
        let url = UserApi.path
        return try await UserApi.makeRequest(urlPath: url, returnType: User.self, payload: payload)
    }
    
    static func current() async throws -> User {
        let url = UserApi.path + "current"
        return try await UserApi.makeRequest(urlPath: url, returnType: User.self, withAuth: true)
    }
}
