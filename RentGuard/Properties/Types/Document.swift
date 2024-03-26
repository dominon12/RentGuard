//
//  Document.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 26/3/24.
//

import Foundation

struct Document: Identifiable, Codable, Hashable {
    var id: String { return self._id ?? UUID().uuidString }
    var _id: String?
    var name: String
    var url: String
}
