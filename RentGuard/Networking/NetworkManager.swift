//
//  NetworkManager.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 28/2/24.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    static let baseUrl = "http://localhost:3000/api/"
    
    private init() {}
}
