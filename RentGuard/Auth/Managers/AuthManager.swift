//
//  AuthManager.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 28/2/24.
//

import Foundation
import Auth0

final class AuthManager: ObservableObject {
    @Published var isAuthenticated = false
    
    init() {
        let credentialsManager = CredentialsManager(authentication: Auth0.authentication())
        isAuthenticated = credentialsManager.canRenew()
    }
}
