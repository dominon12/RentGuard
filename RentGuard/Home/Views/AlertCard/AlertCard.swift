//
//  AlertCard.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 1/3/24.
//

import SwiftUI

struct AlertCard: View {
    var title: String
    var content: String
    
    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            ZStack {
                Rectangle()
                    .frame(width: 32, height: 32)
                    .foregroundColor(.orange)
                    .cornerRadius(6)
                
                Image(systemName: "light.beacon.max")
                    .foregroundColor(.white)
            }
            
            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
                    .foregroundStyle(.secondary)
                
                Text(content)
                    .font(.body)
            }
        }
        .padding()
        .cornerRadius(12)
        .background(.white)
        .clipped()
        .shadow(radius: 2, x: 0, y: 2)
    }
}

#Preview {
    AlertCard(title: "Rent has not been paid",
              content: "Marta Rodriguez had to pay you 890$ before 7th of October for the rent in av. Roentgen 7")
}
