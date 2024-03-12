//
//  AddTransactionView.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 12/3/24.
//

import SwiftUI

@MainActor
struct AddTransactionView: View {
    @ObservedObject var viewModel: AddTransactionViewModel
    
    var body: some View {
        HStack {
            Button {
                viewModel.startCreatingTransaction(type: .credit)
            } label: {
                Label("Credit", systemImage: "plus.app")
                    .frame(maxWidth: .infinity, maxHeight: 50)
                    .background(.green.opacity(0.15))
                    .foregroundColor(.green)
                    .cornerRadius(12)
            }
            
            Button {
                viewModel.startCreatingTransaction(type: .debit)
            } label: {
                Label("Debit", systemImage: "minus.square")
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(.red.opacity(0.15))
                    .foregroundColor(.red)
                    .cornerRadius(12)
            }
        }
        .sheet(isPresented: $viewModel.isShowingForm, content: {
            Form {
                Section("Details") {
                    TextField("Amount", text: $viewModel.form.amount)
                        .keyboardType(.numberPad)
                    TextField("Description", text: $viewModel.form.description)
                    DatePicker("Date", selection: $viewModel.form.date, displayedComponents: .date)
                    Button {
                        Task {
                            await viewModel.saveTransaction()
                        }
                    } label: {
                        Text("Save")
                    }
                    
                    if let error = viewModel.errorDetails {
                        Text(error)
                            .font(.body)
                            .foregroundColor(.red)
                    }
                }
                .presentationDetents([.height(300)])
            }
        })
    }
}

#Preview {
    AddTransactionView(viewModel: AddTransactionViewModel(propertyId: "", 
                                                          transactionsEnv: TransactionsEnvironment()))
}
