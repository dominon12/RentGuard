//
//  PropertiesView.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 27/2/24.
//

import SwiftUI

struct PropertiesView: View {
    var body: some View {
        NavigationStack {
            Text("Properties list")
                .navigationTitle("Properties")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            
                        } label: {
                            Text("Add")
                        }
                    }
                }
        }
    }
}

#Preview {
    PropertiesView()
}
