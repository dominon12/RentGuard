//
//  PropertyFormView.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 5/3/24.
//

import SwiftUI

@MainActor
struct PropertyFormView: View {
    @ObservedObject var viewModel: PropertyFormViewModel

    var body: some View {
        ZStack {
            Form {
                PropertyDataFormView(form: $viewModel.form)
                
                Section(header: Text("Images")) {
                    ImagesFormView(placeholder: "Image url", contentType: .URL, fields: $viewModel.form.images)
                }
                
                Section(header: Text("Documents")) {
                    DocumentFormView(fields: $viewModel.form.documents)
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
    PropertyFormView(viewModel:
                        PropertyFormViewModel(
                            propertiesEnv: PropertiesEnvironment()))
}
