//
//  AlertListViewModel.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 1/3/24.
//

import Foundation

enum AlertListTab: String {
    case today = "today"
    case next = "next"
}

final class AlertListViewModel: ObservableObject {
    @Published var selectedTab: AlertListTab = .today
}
