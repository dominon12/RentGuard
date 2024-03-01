//
//  LoadingView.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 1/3/24.
//

import SwiftUI

struct LoadingView: View {
    var scale: CGFloat = 2
    
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea()
            
            ProgressView()
                .scaleEffect(scale)
        }
    }
}

#Preview {
    LoadingView()
}
