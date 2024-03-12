//
//  PropertyBalance.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 12/3/24.
//

import Foundation

struct PropertyBalance: Decodable {
    var income: Float
    var spent: Float
    var total: Float
}

struct PropertyBalanceMockData {
    static let sampleBalance = PropertyBalance(income: 30000,
                                               spent: 2000,
                                               total: 28000)
}
