//
//  AlertsList.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 1/3/24.
//

import SwiftUI

struct AlertsList: View {
    @StateObject private var viewModel = AlertListViewModel()
    
    var body: some View {
        VStack {
            Picker("For what period of time do you want to see the alerts?",
                   selection: $viewModel.selectedTab) {
                Text("Today").tag(AlertListTab.today)
                
                Text("Next").tag(AlertListTab.next)
            }
           .pickerStyle(.segmented)
           .padding()
            
            List {
                AlertCard(title: "Alquiler está por pagar",
                          content: "Marta Rodriguez tenia que haberte pagado 890$ hasta el dia 7 de octubre por el alquiler del piso en av. Roentgen")
                
                AlertCard(title: "Contrato finaliza pronto",
                          content: "Contrato con Igor Akinin que alquila habitacion B finaliza pronto")
            }
            .listStyle(.inset)
        }
    }
}

#Preview {
    AlertsList()
}
