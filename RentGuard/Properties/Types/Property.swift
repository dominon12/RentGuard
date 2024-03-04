//
//  Property.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 4/3/24.
//

import Foundation

struct Property: Decodable {
    var _id: String
    var name: String
    var address: String
    var images: [String]
    var documents: [String]
    var tenant: User?
    var city: String?
    var postalCode: String?
    var country: String?
    var registrationId: String?
}
