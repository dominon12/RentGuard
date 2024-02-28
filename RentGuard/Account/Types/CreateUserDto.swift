//
//  CreateUserDto.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 28/2/24.
//

import Foundation
import JWTDecode

struct CreateUserDto: Encodable {
    var name: String
    var email: String
    var role: Role
}
