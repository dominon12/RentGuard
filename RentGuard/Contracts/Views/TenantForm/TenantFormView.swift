//
//  TenantFormView.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 9/3/24.
//

import SwiftUI

struct TenantFormView: View {
    @Binding var tenant: TenantForm
    
    var body: some View {
        TextField("Name", text: $tenant.name)
            .textContentType(.name)
        
            TextField("Email", text: $tenant.email)
                .textContentType(.emailAddress)
                .textInputAutocapitalization(.never)
                .disableAutocorrection(true)
        
        TextField("Government Id", text: $tenant.govId)
    }
}

#Preview {
    TenantFormView(tenant: .constant(TenantForm()))
}
