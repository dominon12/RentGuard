//
//  HomeViewModel.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 29/2/24.
//

import SwiftUI
import Observation

@Observable 
@MainActor
final class HomeViewModel {
    var user: User?
    var isLoading = false
    
    func getUser() async {
        isLoading = true
        do {
            user = try await UserApi.current()
        } catch {
            
        }
        isLoading = false
    }
}
