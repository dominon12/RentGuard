//
//  InvoiceFormView.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 15/3/24.
//

import SwiftUI

@MainActor
struct InvoiceFormView: View {
    @EnvironmentObject private var contractEnv: ContractEnvironment
    @ObservedObject var viewModel: InvoiceFormViewModel
    
    var body: some View {
        Form {
            Section("Data") {
                Picker("Invoice type", selection: $viewModel.form.type) {
                    ForEach(InvoiceType.allCases) { option in
                        Text(String(describing: option))
                    }
                }
                
                if viewModel.form.type == .other {
                    TextField("Description", text: $viewModel.form.description)
                }
                
                TextField("Amount", text: $viewModel.form.amount)
                    .keyboardType(.numberPad)
                
                DatePicker("Due date", selection: $viewModel.form.dueDate, displayedComponents: .date)
                
                Toggle(isOn: $viewModel.form.wasPaid, label: {
                    Text("Was paid")
                })
                
                Button {
                    Task {
                        await viewModel.saveForm(contractId: contractEnv.contract?._id ?? "")
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
            .presentationDetents([.height(350)])
        }
    }
}

#Preview {
    InvoiceFormView(viewModel: InvoiceFormViewModel(invoiceEnv: InvoiceEnvironment(), showForm: .constant(true)))
}
