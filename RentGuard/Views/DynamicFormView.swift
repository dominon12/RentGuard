//
//  FileListFormView.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 5/3/24.
//

import SwiftUI

struct FormField: Identifiable {
    var id = UUID()
    var value = ""
}

struct DynamicFormView: View {
    var placeholder: String
    var contentType: UITextContentType?
    @Binding var fields: [FormField]
    
    var body: some View {
        ForEach(Array(fields.enumerated()), id: \.1.id) { index, _ in
            HStack {
                TextField(placeholder, text: $fields[index].value)
                    .textContentType(contentType)
                
                if canDeleteField {
                    Button {
                        deleteField(at: index)
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

extension DynamicFormView {
    var canAddField: Bool {
        !fields.filter { field in
            field.value.isEmpty
        }.isEmpty
    }
    
    var canDeleteField: Bool {
        fields.filter { field in
            !field.value.isEmpty
        }.count >= 2
    }
    
    func deleteField(at index: Int) {
        fields.remove(at: index)
    }
    
    func addField() {
        fields.append(FormField())
    }
}

#Preview {
    DynamicFormView(placeholder: "Form field", fields: .constant([FormField()]))
}
