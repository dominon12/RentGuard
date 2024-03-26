//
//  CreateContractDto.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 9/3/24.
//

import Foundation

struct SaveTenantDto: Encodable {
    var name: String
    var email: String
    var govId: String?
}

struct SaveContractDto: Encodable {
    var property: String
    var tenant: SaveTenantDto
    var from: String
    var until: String
    var rent: Float
    var documents: [Document]
    var deposit: Float
}
