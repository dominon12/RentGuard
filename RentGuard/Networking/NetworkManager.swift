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
    
    static func makeRequest<T>(urlPath: String,
                               returnType: T.Type,
                               query: [URLQueryItem] = [],
                               payload: Encodable? = nil,
                               withAuth: Bool? = false,
                               method: String? = "GET") async throws -> T where T : Decodable {
        // create request
        guard var url = URL(string: NetworkManager.baseUrl + urlPath) else {
            throw NetworkError.invalidUrl
        }
        url.append(queryItems: query)
        var request = URLRequest(url: url)
        request.httpMethod = method
        
        // handle authentication
        if withAuth != nil && withAuth == true {
            guard let accessToken else {
                throw NetworkError.notAuthenticated
            }
            request.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
        }
        
        // handle payload
        if let payload {
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            
            do {
                request.httpBody = try JSONEncoder().encode(payload)
            } catch {
                throw NetworkError.invalidRequestBody
            }
        }
        
        do {
            // send request
            let (data, response) = try await URLSession.shared.data(for: request)
            print(response)
            
            do {
                // parse response
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601WithFractionalSeconds
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
