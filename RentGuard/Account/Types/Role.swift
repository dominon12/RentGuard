//
//  Role.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 28/2/24.
//

import Foundation

enum Role: String, Codable {
    case owner = "owner"
    case tenant = "tenant"
}
