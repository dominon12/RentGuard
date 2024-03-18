//
//  InvoicesListViewModel.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 14/3/24.
//

import SwiftUI


@MainActor
final class InvoicesListViewModel: ObservableObject {
    @Published var showPaid = false
    @Published var isCreatingInvoice = false
}
