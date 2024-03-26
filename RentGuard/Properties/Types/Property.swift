//
//  Property.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 4/3/24.
//

import Foundation

struct Address: Codable, Hashable {
    var address: String
    var city: String?
    var postalCode: String?
    var country: String?
}

struct Property: Codable, Hashable {
    var _id: String
    var name: String
    var address: Address
    var images: [String]
    var documents: [Document]
    var registrationId: String?
    var surface: String?
    var price: String?
    
    var fullAddress: String {
        var result = address.address
        
        if let city = address.city {
            result += ", " + city
        }
        if let postalCode = address.postalCode {
            result += ", " + postalCode
        }
        if let country = address.country {
            result += ", " + country
        }
        
        return result
    }
}

struct PropertyMockData {
    static var sampleProperty = Property(_id: "",
                                         name: "Test property",
                                         address: Address(address: "C/ Remolcador 6, 5", 
                                                          city: "Valencia",
                                                          postalCode: "46009",
                                                          country: "Spain"),
                                         images: [],
                                         documents: [],
                                         registrationId: nil,
                                         surface: "57m2",
                                         price: "100000")
}
