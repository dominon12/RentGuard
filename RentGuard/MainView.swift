//
//  MainView.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 27/2/24.
//

import SwiftUI

@MainActor
struct MainView: View {
    @StateObject private var propertiesEnv = PropertiesEnvironment()
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem { Label("Home", systemImage: "house") }
            
            PropertiesView()
                .environmentObject(propertiesEnv)
                .tabItem { Label("Properties", systemImage: "building.2.fill") }
            
            AccountView()
                .tabItem { Label("Account", systemImage: "person") }
        }
    }
}

#Preview {
    MainView()
}
