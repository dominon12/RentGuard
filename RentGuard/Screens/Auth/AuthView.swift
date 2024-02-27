//
//  AuthView.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 27/2/24.
//

import SwiftUI

struct AuthView: View {
    var body: some View {
        VStack {
            Text("Welcome \nto Rent Guard")
                .font(.largeTitle)
                .multilineTextAlignment(.center)
            
            Text("Please authenticate to start using the app.")
                .font(.title2)
                .multilineTextAlignment(.center)
                .padding()
            
            Button {
                
            } label: {
                Text("Authenticate")
            }
            .buttonStyle(.bordered)
            .controlSize(.large)
            .tint(.accentColor)
        }
    }
}

#Preview {
    AuthView()
}
