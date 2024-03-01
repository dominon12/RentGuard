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
        VStack {
            Picker("For what period of time do you want to see the alerts?",
                   selection: $viewModel.selectedTab) {
                Text("Today").tag(AlertListType.today)
                
                Text("Next").tag(AlertListType.next)
            }
                   .pickerStyle(.segmented)
                   .padding(.bottom)
            
            ZStack {
                VStack(spacing: 16) {
                    ForEach(viewModel.alerts) { alert in
                        AlertCardView(alert: alert)
                    }
                }
                
                if viewModel.isLoading {
                    LoadingView(scale: 1)
                        .frame(height: 200)
                }
            }
        }
        .padding()
        .task(id: viewModel.selectedTab) {
            await viewModel.getAlerts()
        }
    }
}

#Preview {
    AlertsListView()
}
