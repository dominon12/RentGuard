//
//  AuthManager.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 28/2/24.
//

import Foundation
import Auth0
import JWTDecode

@MainActor final class AuthManager: ObservableObject {
    @Published var isAuthenticated = false
    let credentialsManager = CredentialsManager(authentication: Auth0.authentication())
    
    init() {
        isAuthenticated = credentialsManager.canRenew()
    }
    
    func login() {
        Auth0
            .webAuth()
            .scope("openid profile email offline_access")
            .start { [self] result in
                switch result {
                case .success(let credentials):
                    Task {
                        let didCreateUser = await createUserInDb(from: credentials.idToken)
                        if didCreateUser {
                            let isStored = credentialsManager.store(credentials: credentials)
                            if isStored {
                                isAuthenticated = true
                            }
                        }
                    }
                case .failure(let error):
                    // todo: show alert
                    print("Failed with: \(error)")
                }
            }
    }
    
    private func createUserInDb(from idToken: String) async -> Bool {
        guard
            let jwt = try? decode(jwt: idToken),
            let name = jwt.claim(name: "name").string,
            let email = jwt.claim(name: "email").string
        else {
            print("Failed to decode id token")
            return false
        }
        
        let payload = CreateUserDto(name: name, email: email, role: .owner)
        
        do {
            try await UserApi.create(payload)
            return true
        } catch {
            print("Error creating user in db")
            return false
        }
    }
    
    func logout() {
        Auth0
            .webAuth()
            .clearSession { [self] result in
                switch result {
                case .success():
                    let didClear = credentialsManager.clear()
                    if didClear {
                        isAuthenticated = false
                    }
                case .failure(let error):
                    // todo: show alert
                    print("Couldn't log out: \(error)")
                }
            }
    }
}
