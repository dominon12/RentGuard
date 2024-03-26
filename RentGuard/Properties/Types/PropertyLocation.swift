//
//  PropertyLocation.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 26/3/24.
//

import Foundation

struct PropertyLocation: Identifiable, Decodable {
    let id: String
    let name: String
    let latitude: Double
    let longitude: Double
}
