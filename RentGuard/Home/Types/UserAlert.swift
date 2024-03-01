//
//  UserAlert.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 1/3/24.
//

import Foundation

struct UserAlert: Decodable, Identifiable {
    var id: String
    var title: String
    var content: String
}
