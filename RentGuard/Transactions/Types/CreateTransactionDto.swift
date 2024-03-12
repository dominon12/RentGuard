//
//  CreateTransactionDto.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 12/3/24.
//

import Foundation

struct CreateTransactionDto: Encodable {
    var property: String
    var type: TransactionType
    var amount: Float
    var description: String?
}
