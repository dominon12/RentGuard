//
//  User.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 29/2/24.
//

import Foundation

struct User: Codable, Hashable {
    var _id: String
    var email: String
    var name: String
    var role: Role
}
