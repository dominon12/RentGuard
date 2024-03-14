//
//  Invoice.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 14/3/24.
//

import Foundation

struct Invoice: Decodable {
    var _id: String
    var type: InvoiceType
    var amount: Float
    var wasPaid: Bool
    var dueDate: Date
    var createdAt: Date
}
