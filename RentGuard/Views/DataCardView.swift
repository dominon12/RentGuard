//
//  DataCardView.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 6/3/24.
//

import SwiftUI

struct DataCardView<Actions: View>: View {
    let title: String?
    let data: [(String, String)]
    let documents: [Document]
    let actions: (() -> Actions)?
    
    var body: some View {
        VStack {
            if let title {
                HStack {
                    Text(title)
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Spacer()
                    
                    if let actions = actions?() {
                        actions
                    }
                }
                .padding(.bottom, 4)
            }
            
            VStack(alignment: .leading) {
                ForEach(data, id: \.0) { key, value in
                    HStack {
                        Text("\(key):")
                            .font(.body)
                            .bold()
                        
                        Text(value)
                            .font(.body)
                            .lineLimit(1)
                        
                        Spacer()
                    }
                }
            }
            
            if !documents.isEmpty {
                HStack {
                    ForEach(documents, id: \.self) { doc in
                        if let docUrl = URL(string: doc.url) {
                            Link(destination: docUrl) {
                                VStack {
                                    Image(systemName: "doc")
                                        .foregroundColor(.blue)
                                    
                                    Spacer()
                                    
                                    Text(doc.name)
                                        .font(.caption)
                                        .lineLimit(1)
                                }
                            }
                            .foregroundColor(.primary)
                            .padding(10)
                            .frame(width: 60, height: 60)
                            .background(.secondary.opacity(0.1))
                        }
                    }
                    
                    Spacer()
                }
                .padding(.top)
                .frame(maxWidth: .infinity)
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
        .cornerRadius(12)
        .background(.white)
        .clipped()
        .shadow(radius: 2, x: 0, y: 2)
    }
}

#Preview {
    DataCardView(title: "Data",
                 data: [
                    ("Address", "C/ Remolcador"),
                    ("Surface", "57m2"),
                    ("Registration Id", "R123131231INX"),
                    ("Price", "100'000$")
                 ],
                 documents: []) {
        Button {
            
        } label: {
            Text("Edit")
        }
    }
}
