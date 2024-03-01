//
//  AlertsList.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 1/3/24.
//

import SwiftUI

struct AlertsListView: View {
    @StateObject private var viewModel = AlertListViewModel()
    
    var body: some View {
        VStack {
            Picker("For what period of time do you want to see the alerts?",
                   selection: $viewModel.selectedTab) {
                Text("Today").tag(AlertListTab.today)
                
                Text("Next").tag(AlertListTab.next)
            }
                   .pickerStyle(.segmented)
                   .padding(.bottom)
            
            ZStack {
                VStack(spacing: 16) {
//                    AlertCard(title: "Alquiler está por pagar",
//                              content: "Marta Rodriguez tenia que haberte pagado 890$ hasta el dia 7 de octubre por el alquiler del piso en av. Roentgen")
//                    
//                    AlertCard(title: "Contrato finaliza pronto",
//                              content: "Contrato con Igor Akinin que alquila habitacion B finaliza pronto")
//                    
//                    AlertCard(title: "Contrato finaliza pronto",
//                              content: "Contrato con Igor Akinin que alquila habitacion B finaliza pronto")
//                    
//                    AlertCard(title: "Contrato finaliza pronto",
//                              content: "Contrato con Igor Akinin que alquila habitacion B finaliza pronto")
//                    
//                    AlertCard(title: "Contrato finaliza pronto",
//                              content: "Contrato con Igor Akinin que alquila habitacion B finaliza pronto")
                }
                
                if viewModel.isLoading {
                    LoadingView(scale: 1)
                        .frame(height: 200)
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
