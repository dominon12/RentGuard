//
//  AlertListViewModel.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 1/3/24.
//

import Foundation

@MainActor
final class AlertListViewModel: ObservableObject {
    @Published var selectedTab: AlertListType = .today
    @Published var alerts = [UserAlert]()
    @Published var isLoading = false
    
    func getAlerts() async {
        isLoading = true
        do {
            alerts = try await AlertsApi.getAlerts(type: selectedTab)
            print(alerts)
        } catch {
            print(error)
        }
        isLoading = false
    }
}
