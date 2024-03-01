//
//  NetworkError.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 28/2/24.
//

import Foundation

enum NetworkError: Error {
    case invalidUrl
    case invalidRequestBody
    case invalidResponse
    case requestFailed
    case notAuthenticated
}
