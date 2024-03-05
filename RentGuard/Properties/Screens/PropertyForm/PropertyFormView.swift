//
//  PropertyFormView.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 5/3/24.
//

import SwiftUI

struct PropertyFormView: View {
    @ObservedObject var viewModel: PropertyFormViewModel
    
    var body: some View {
        NavigationStack {
            Form {
                PropertyDataFormView(form: $viewModel.form)
                
                Section(header: Text("Images")) {
                    DynamicFormView(placeholder: "Image url", contentType: .URL, fields: $viewModel.form.images)
                }
                
                Section(header: Text("Documents")) {
                    DynamicFormView(placeholder: "Document url", contentType: .URL, fields: $viewModel.form.documents)
                }
            }
            .navigationTitle(viewModel.title)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        viewModel.save()
                    } label: {
                        Text("Save")
                    }
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
    PropertyFormView(
        viewModel: PropertyFormViewModel(isActive: .constant(true)))
}
