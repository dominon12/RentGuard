//
//  AuthManager.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 28/2/24.
//

import SwiftUI
import Auth0
import JWTDecode

struct AuthManagerDefaults {
    static let accessToken = "accessToken"
}

final class AuthManager: ObservableObject {
    @Published var isAuthenticated = false
    let credentialsManager = CredentialsManager(authentication: Auth0.authentication())
    @AppStorage(AuthManagerDefaults.accessToken) var accessToken: String?
    
    init() {
        isAuthenticated = credentialsManager.hasValid()
        if let accessToken {
            print(accessToken)
        }
    }
    
    func checkAccessToken(_ token: String?) {
        if token == nil {
            isAuthenticated = false
        }
    }
    
    func login() {
        Auth0
            .webAuth()
            .audience("https://api.rent-guard.com")
            .scope("openid profile email offline_access")
            .start { result in
                switch result {
                case .success(let credentials):
                    DispatchQueue.main.async {
                        Task {
                            await self.createUserInDb(from: credentials.idToken)
                            let isStored = self.credentialsManager.store(credentials: credentials)
                            self.accessToken = credentials.accessToken
                            print(credentials.accessToken)
                            if isStored {
                                self.isAuthenticated = true
                            }
                        }
                    }
                case .failure(let error):
                    // todo: show alert
                    print("Failed with: \(error)")
                }
            }
    }
    
    private func createUserInDb(from idToken: String) async {
        guard
            let jwt = try? decode(jwt: idToken),
            let name = jwt.claim(name: "name").string,
            let email = jwt.claim(name: "email").string
        else {
            print("Failed to decode id token")
            return
        }
        
        let payload = CreateUserDto(name: name, email: email, role: .owner)

        do {
            try await AccountApi.create(payload)
        } catch {
            print("Error creating user in db")
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
                        accessToken = nil
                        isAuthenticated = false
                    }
                case .failure(let error):
                    // todo: show alert
                    print("Couldn't log out: \(error)")
                }
            }
    }
}
