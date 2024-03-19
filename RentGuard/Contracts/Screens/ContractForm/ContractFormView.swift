//
//  TenantFormView.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 7/3/24.
//

import SwiftUI

struct ContractFormView: View {
    @ObservedObject var viewModel: ContractFormViewModel
    
    var body: some View {
        ZStack {
            Form {
                Section(header: Text("Tenant"), 
                        footer: Text("We will notify tenant about new invoices by email.")
                            .font(.caption)
                            .foregroundColor(.secondary),
                        content: {
                    TenantFormView(tenant: $viewModel.form.tenant)
                })
                
                Section(header: Text("Data"), footer: Text("You will be notified 1 month before the contract finishes.")) {
                    ContractDataFormView(form: $viewModel.form)
                }
                
                Section(header: Text("Documents")) {
                    DynamicFormView(placeholder: "Document url", contentType: .URL, fields: $viewModel.form.documents)
                }
            }
            
            if viewModel.isSaving {
                LoadingView(opacity: 0.6)
            }
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    Task {
                        await viewModel.save()
                    }
                } label: {
                    Text("Save")
                }
            }
        }
        .alert(item: $viewModel.alert) { alert in
            Alert(title: alert.title,
                  message: alert.message,
                  dismissButton: alert.dismissButton)
        }
    }
}

#Preview {
    ContractFormView(viewModel: ContractFormViewModel(propertyId: "", contractEnv: ContractEnvironment()))
}
