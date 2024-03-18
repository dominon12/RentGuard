//
//  AlertsList.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 1/3/24.
//

import SwiftUI

@MainActor
struct AlertsListView: View {
    @StateObject private var viewModel = AlertListViewModel()
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Alerts")
                .font(.title)
                .bold()
            
            if viewModel.alerts.isEmpty {
                EmptyState(imageName: "empty-box", message: "There are no alerts.")
                    .frame(height: 400)
            } else {
                VStack {
                    VStack(spacing: 16) {
                        ForEach(viewModel.alerts) { alert in
                            AlertCardView(alert: alert)
                        }
                    }
                }
            }
        }
        .padding()
        .task {
            await viewModel.getAlerts()
        }
    }
}

#Preview {
    AlertsListView()
}
