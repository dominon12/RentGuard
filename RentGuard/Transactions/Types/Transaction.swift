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
}
