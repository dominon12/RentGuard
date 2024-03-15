//
//  InvoicesListViewModel.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 14/3/24.
//

import SwiftUI

enum InvoiceListType: String {
    case paid = "paid"
    case unpaid = "unpaid"
}

@MainActor
final class InvoicesListViewModel: ObservableObject {
    @Published var selectedTab: InvoiceListType = .unpaid
    

}
