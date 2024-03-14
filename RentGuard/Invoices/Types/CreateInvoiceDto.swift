//
//  CreateInvoiceDto.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 14/3/24.
//

import Foundation

struct CreateInvoiceDto: Encodable {
    var contract: String
    var type: InvoiceType
    var amount: Float
    var dueDate: Date
}
