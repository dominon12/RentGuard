//
//  Contract.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 9/3/24.
//

import Foundation

struct Tenant: Decodable {
    var name: String
    var email: String
    var govId: String?
}

struct Contract: Decodable {
    var _id: String
    var property: String
    var tenant: Tenant
    var from: Date
    var until: Date
    var rent: Float
    var deposit: Float
    var documents: [Document]
}

struct ContractMockData {
    static let sampleContract = Contract(_id: "", 
                                         property: "",
                                         tenant: Tenant(name: "Igor Akinin", 
                                                        email: "twinbatshole@gmail.com"),
                                         from: Date(),
                                         until: Date(),
                                         rent: 208,
                                         deposit: 200,
                                         documents: [])
}
