//
//  Contract.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 9/3/24.
//

import Foundation

struct Contract: Codable {
    var _id: String
    var property: String
    var tenant: User
    var from: Date
    var until: Date
    var rent: Float
    var documents: [String]
    var deposit: Float?
}

struct ContractMockData {
    static let sampleContract = Contract(_id: "", 
                                         property: "", 
                                         tenant: User(_id: "",
                                                      email: "twinbatshole@gmail.com",
                                                      name: "Igor Akinin",
                                                      role: .tenant), 
                                         from: Date(),
                                         until: Date(),
                                         rent: 208,
                                         documents: [],
                                         deposit: 200)
}
