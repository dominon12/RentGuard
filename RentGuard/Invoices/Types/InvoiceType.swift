//
//  InvoiceType.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 14/3/24.
//

import Foundation

enum InvoiceType: String, Codable {
    case rent = "rent"
    case utilities = "utilities"
    case other = "other"
}
