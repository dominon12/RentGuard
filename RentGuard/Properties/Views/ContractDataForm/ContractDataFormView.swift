//
//  ContractDataFormView.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 9/3/24.
//

import SwiftUI

struct ContractDataFormView: View {
    @Binding var form: ContractForm
    
    var body: some View {
        DatePicker("From", selection: $form.from, displayedComponents: .date)
        
        DatePicker("Until", selection: $form.until, displayedComponents: .date)
        
        TextField("Rent", text: $form.rent)
            .keyboardType(.numberPad)
        
        TextField("Deposit", text: $form.deposit)
            .keyboardType(.numberPad)
    }
}

#Preview {
    ContractDataFormView(form: .constant(ContractForm()))
}
