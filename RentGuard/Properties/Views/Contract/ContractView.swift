//
//  ContractView.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 9/3/24.
//

import SwiftUI

struct ContractView: View {
    @ObservedObject var viewModel: ContractViewModel
    
    var body: some View {
        ZStack {
            if !viewModel.isLoading {
                if let contract = viewModel.contract {
                    ContractCardView(contract: contract)
                } else {
                    AddContractView()
                        .padding(.horizontal)
                }
            }
        }
        .task {
            await viewModel.getContract()
        }
    }
}

#Preview {
    ContractView(viewModel: 
                    ContractViewModel(
                        propertyId: PropertyMockData.sampleProperty._id))
}
