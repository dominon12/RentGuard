//
//  UpdateInvoiceDto.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 14/3/24.
//

import Foundation

struct UpdateInvoiceDto: Encodable {
    var type: InvoiceType
    var amount: Float
    var wasPaid: Bool
    var dueDate: Date
}
