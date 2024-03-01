//
//  User.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 29/2/24.
//

import Foundation

struct User: Decodable {
    var email: String
    var name: String
    var role: Role
}
