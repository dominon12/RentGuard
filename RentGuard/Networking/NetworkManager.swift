//
//  NetworkManager.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 28/2/24.
//

import SwiftUI

@MainActor
class NetworkManager {
    static let shared = NetworkManager()
    static let baseUrl = "http://localhost:3000/api/"
    @AppStorage("accessToken") static var accessToken: String?
    
    private init() {}
    
    static func requestWithAuth<T>(urlPath: String,
                                   returnType: T.Type,
                                   query: [URLQueryItem] = []) async throws -> T where T : Decodable {
        guard let accessToken else {
            throw NetworkError.notAuthenticated
        }
        
        guard var url = URL(string: NetworkManager.baseUrl + urlPath) else {
            throw NetworkError.invalidUrl
        }
        url.append(queryItems: query)
        
        var request = URLRequest(url: url)
        request.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            print(response)
            
            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(returnType, from: data)
                return decodedResponse
            } catch {
                print(error)
                throw NetworkError.invalidResponse
            }
        } catch {
            print(error)
            throw NetworkError.requestFailed
        }
    }
}
