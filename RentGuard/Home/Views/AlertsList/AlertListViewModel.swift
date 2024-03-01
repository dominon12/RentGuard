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
    @Published var alerts = [UserAlert]()
    @Published var isLoading = false
    
    func getAlerts() async {
        isLoading = true
        do {
            alerts = try await AlertsApi.getAlerts()
        } catch {
            
        }
        isLoading = false
    }
}
