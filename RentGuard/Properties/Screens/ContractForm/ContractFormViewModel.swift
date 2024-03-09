//
//  ContractFormViewModel.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 9/3/24.
//

import SwiftUI

struct TenantForm {
    var name = ""
    var email = ""
    var govId = ""
}

struct ContractForm {
    var tenant = TenantForm()
    var from = Date()
    var until = Date()
    var rent = ""
    var documents = [FormField()]
    var deposit = ""
}

@MainActor
final class ContractFormViewModel: ObservableObject {
    private let propertyId: String
    private let contractEnv: ContractEnvironment
    @Published var form = ContractForm()
    @Published var alert: AlertItem?
    @Published var isSaving = false
    
    init(propertyId: String, contractEnv: ContractEnvironment) {
        self.propertyId = propertyId
        self.contractEnv = contractEnv
        
        if let contract = contractEnv.contract {
            form = ContractForm(tenant: TenantForm(name: contract.tenant.name,
                                                   email: contract.tenant.email,
                                                   govId: contract.tenant.govId ?? ""),
                                from: contract.from,
                                until: contract.until,
                                rent: String(contract.rent),
                                documents: contract.documents.map({ docUrl in FormField(id: UUID(), value: docUrl)}),
                                deposit: String(contract.deposit))
        }
    }

    var isValidForm: Bool {
        guard !form.tenant.name.isEmpty &&
                !form.tenant.email.isEmpty &&
                Float(form.rent) != nil &&
                Float(form.deposit) != nil else {
            alert = ContractsAlerts.formInvalid
            return false
        }
        return true
    }
    
    func save() async {
        guard isValidForm else { return }
        
        let payload = SaveContractDto(property: propertyId,
                                      tenant: SaveTenantDto(name: form.tenant.name,
                                                            email: form.tenant.email, 
                                                            govId: form.tenant.govId),
                                      from: form.from.ISO8601Format(),
                                      until: form.until.ISO8601Format(),
                                      rent: Float(form.rent) ?? 0,
                                      documents: form.documents.filter({ field in !field.value.isEmpty }).map({ field in field.value }),
                                      deposit: Float(form.deposit) ?? 0)
        
        isSaving = true
        do {
            if let contract = contractEnv.contract {
                try await ContractsApi.update(id: contract._id, payload: payload)
            } else {
                try await ContractsApi.create(payload: payload)
            }
            
            await contractEnv.getContract(propertyId: propertyId)
            contractEnv.isShowingForm = false
        } catch {
            alert = ContractsAlerts.saveFailed
        }
        isSaving = false
    }
}
