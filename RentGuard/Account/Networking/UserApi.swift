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
        guard let url = URL(string: NetworkManager.baseUrl + UserApi.path) else {
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
            let (data, _) = try await URLSession.shared.data(for: request)
        } catch {
            throw NetworkError.requestFailed
        }
    }
}
