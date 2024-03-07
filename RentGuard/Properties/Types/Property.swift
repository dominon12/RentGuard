//
//  Property.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 4/3/24.
//

import Foundation

struct Property: Codable, Hashable {
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
    var surface: String?
    var price: String?
}

struct PropertyMockData {
    static var sampleProperty = Property(_id: "",
                                         name: "Test property",
                                         address: "C/ Remolcador 6, 5",
                                         images: [],
                                         documents: [],
                                         tenant: User(_id: "",
                                                      email: "email@mail.com",
                                                      name: "Jose Alvarez",
                                                      role: .tenant),
                                         city: "Valencia",
                                         postalCode: "46009",
                                         country: "Spain",
                                         registrationId: nil,
                                         surface: "57m2",
                                         price: "100000")
}
