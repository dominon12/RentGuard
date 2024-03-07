//
//  CreatePropertyDto.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 6/3/24.
//

import Foundation

struct SavePropertyDto: Encodable {
    var name: String
    var address: String
    var images: [String]
    var documents: [String]
    var city: String?
    var postalCode: String?
    var country: String?
    var registrationId: String?
    var surface: String?
    var price: String?
}
