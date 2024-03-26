//
//  DocumentsFormView.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 26/3/24.
//

import SwiftUI

struct DocumentFormField: Identifiable {
    var id = UUID()
    var name = ""
    var url = ""
}

struct DocumentFormView: View {
    @Binding var fields: [DocumentFormField]
    
    var body: some View {
        ForEach(Array(fields.enumerated()), id: \.1.id) { index, _ in
            HStack {
                TextField("Name", text: $fields[index].name)
                
                TextField("URL", text: $fields[index].url)
                    .textContentType(.URL)
                
                if canDeleteField {
                    Button {
                        deleteField(id: $fields[index].id)
                    } label: {
                        Image(systemName: "x.circle")
                            .foregroundColor(.red)
                    }
                }
            }
        }
        
        Button {
            addField()
        } label: {
            Text("Add")
        }
        .disabled(canAddField)
    }
}

extension DocumentFormView {
    var canAddField: Bool {
        !fields.filter { field in
            field.name.isEmpty && field.url.isEmpty
        }.isEmpty
    }
    
    var canDeleteField: Bool {
        fields.count > 1
    }
    
    func deleteField(id: UUID) {
        fields = fields.filter({ field in
            field.id != id
        })
    }
    
    func addField() {
        fields.append(DocumentFormField())
    }
}

#Preview {
    DocumentFormView(fields: .constant([DocumentFormField()]))
}
