//
//  InvoiceType.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 14/3/24.
//

import Foundation

enum InvoiceType: String, Codable, CaseIterable, Identifiable, CustomStringConvertible {
    var id: Self { self }
    
    case rent = "rent"
    case utilities = "utilities"
    case other = "other"
    
    var description: String {
        switch self {
        case .rent:
            return "Rent"
        case .utilities:
            return "Utilities"
        case .other:
            return "Other"
        }
    }
}
