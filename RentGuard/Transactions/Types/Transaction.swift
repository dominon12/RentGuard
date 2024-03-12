//
//  Transaction.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 12/3/24.
//

import Foundation

struct Transaction: Decodable {
    var _id: String
    var property: String
    var type: TransactionType
    var amount: Float
    var createdAt: Date
    var description: String?
}

struct TransactionMockData {
    static let sampleTransaction = Transaction(_id: "",
                                               property: "",
                                               type: .credit,
                                               amount: 300,
                                               createdAt: Date(),
                                               description: "Rent in april, first part.")
}
