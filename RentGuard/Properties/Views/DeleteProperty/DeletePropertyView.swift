//
//  DeleteProperty.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 6/3/24.
//

import SwiftUI

@MainActor
struct DeletePropertyView: View {
    @ObservedObject var viewModel: DeletePropertyViewModel
    
    var body: some View {
        Button {
            viewModel.showConfirmation = true
        } label: {
            Text("Delete Property")
        }
        .controlSize(.large)
        .frame(maxWidth: .infinity)
        .frame(height: 50)
        .background(.red)
        .foregroundColor(.white)
        .cornerRadius(12)
        .confirmationDialog("Are you sure you want to delete this property?",
                            isPresented: $viewModel.showConfirmation,
                            titleVisibility: .visible) {
            Button("Yes, delete", role: .destructive) {
                Task {
                    await viewModel.deleteProperty()
                }
            }
        } message: {
            Text("Proceed with caution! This action is permanent and cannot be reverted.")
        }
    }
}

#Preview {
    DeletePropertyView(viewModel:
                        DeletePropertyViewModel(refetch: {},
                                                property: .constant(PropertyMockData.sampleProperty)))
}
