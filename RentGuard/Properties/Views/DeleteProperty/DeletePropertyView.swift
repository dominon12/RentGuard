//
//  DeleteProperty.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 6/3/24.
//

import SwiftUI

struct DeletePropertyView: View {
    var body: some View {
        Button {
            
        } label: {
            Text("Delete Property")
        }
        .controlSize(.large)
        .frame(maxWidth: .infinity)
        .frame(height: 50)
        .background(.red)
        .foregroundColor(.white)
        .cornerRadius(12)
    }
}

#Preview {
    DeletePropertyView()
}
