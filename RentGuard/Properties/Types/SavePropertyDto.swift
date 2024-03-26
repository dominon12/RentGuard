//
//  CreatePropertyDto.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 6/3/24.
//

import Foundation

struct SaveAddressDto: Encodable {
    var address: String
    var city: String?
    var postalCode: String?
    var country: String?
}

struct SavePropertyDto: Encodable {
    var name: String
    var address: SaveAddressDto
    var images: [String]
    var documents: [Document]
    var registrationId: String?
    var surface: String?
    var price: String?
}
