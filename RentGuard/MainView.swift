//
//  MainView.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 27/2/24.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem { Label("Home", systemImage: "house") }
            
            PropertiesView()
                .tabItem { Label("Properties", systemImage: "building.2.fill") }
            
            AccountView()
                .tabItem { Label("Account", systemImage: "person") }
        }
    }
}

#Preview {
    MainView()
}
