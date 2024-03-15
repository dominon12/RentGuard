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
    var description: String?
}

struct InvoiceMockData {
    static let sampleInvoice = Invoice(_id: "",
                                       type: .rent,
                                       amount: 300,
                                       wasPaid: false,
                                       dueDate: Date(),
                                       createdAt: Date())
}
