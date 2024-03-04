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
        guard let url = URL(string: UserApi.baseUrl + UserApi.path) else {
            throw NetworkError.invalidUrl
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            request.httpBody = try JSONEncoder().encode(payload)
        } catch {
            throw NetworkError.invalidRequestBody
        }
        
        do {
            let (_, _) = try await URLSession.shared.data(for: request)
        } catch {
            throw NetworkError.requestFailed
        }
    }
    
    static func current() async throws -> User {
        let url = UserApi.path + "current"
        return try await UserApi.requestWithAuth(urlPath: url, returnType: User.self)
    }
}
