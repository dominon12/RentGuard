//
//  AlertListViewModel.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 1/3/24.
//

import Foundation

@MainActor
final class AlertListViewModel: ObservableObject {
    @Published var alerts = [UserAlert]()
    
    func getAlerts() async {
        do {
            alerts = try await AlertsApi.getAlerts()
        } catch {
            print(error)
        }
    }
}
