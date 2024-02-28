//
//  RentGuardApp.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 27/2/24.
//

import SwiftUI

@main
struct RentGuardApp: App {
    private var authManager = AuthManager()
    
    var body: some Scene {
        WindowGroup {
            AuthGuard()
                .environmentObject(authManager)
        }
    }
}
