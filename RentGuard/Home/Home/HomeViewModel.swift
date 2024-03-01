//
//  HomeViewModel.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 29/2/24.
//

import SwiftUI
import Observation

@Observable @MainActor final class HomeViewModel {
    var user: User?
    
    func getUser() async {
        do {
            user = try await UserApi.current()
        } catch {
            
        }
    }
}
