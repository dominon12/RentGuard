//
//  PropertyRentabilityView.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 6/3/24.
//

import SwiftUI

struct PropertyRentabilityView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Rentability")
                .font(.title2)
                .fontWeight(.semibold)
            
            DataCardView(title: nil,
                         data: [
                            ("Rent", "30000$"),
                            ("Spent", "2000$"),
                            ("Rentability", "28000$"),
                         ],
                         documents: []) {
                Text("")
                    .hidden()
            }
                         .padding(.bottom, 10)
            
            HStack {
                Button {
                    
                } label: {
                    Label("Credit", systemImage: "plus.app")
                }
                .controlSize(.large)
                .frame(maxWidth: .infinity, maxHeight: 50)
                .background(.green.opacity(0.15))
                .foregroundColor(.green)
                .cornerRadius(12)
                
                Button {
                    
                } label: {
                    Label("Debit", systemImage: "minus.square")
                }
                .controlSize(.large)
                .frame(maxWidth: .infinity)
                .frame(height: 50)
                .background(.red.opacity(0.15))
                .foregroundColor(.red)
                .cornerRadius(12)
            }
            
            Button {
                
            } label: {
                Label("View History", systemImage: "clock")
            }
            .controlSize(.large)
            .frame(maxWidth: .infinity)
            .frame(height: 50)
            .background(.blue.opacity(0.15))
            .cornerRadius(12)
        }
        .padding()
    }
}

#Preview {
    PropertyRentabilityView()
}
