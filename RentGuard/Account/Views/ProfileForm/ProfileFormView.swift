//
//  ProfileFormView.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 13/3/24.
//

import SwiftUI

@MainActor
struct ProfileFormView: View {
    @StateObject private var viewModel = ProfileFormViewModel()
    
    var body: some View {
        ZStack {
            Form {
                Section("User info") {
                    TextField("Name", text: $viewModel.form.name)
                        .textContentType(.name)
                    
                    TextField("Email", text: .constant(viewModel.user?.email ?? ""))
                        .textContentType(.emailAddress)
                        .foregroundColor(.secondary)
                        .disabled(true)
                    
                    Button {
                        Task {
                            await viewModel.saveProfile()
                        }
                    } label: {
                        Text("Save")
                    }
                }
            }
            
            if viewModel.isSaving {
                LoadingView(opacity: 0.6)
            }
        }
        .task {
            await viewModel.loadUser()
        }
        .alert(item: $viewModel.alert) { alert in
            Alert(title: alert.title,
                  message: alert.message,
                  dismissButton: alert.dismissButton)
        }
    }
}

#Preview {
    ProfileFormView()
}
