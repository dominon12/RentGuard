//
//  PropertyDetailsViewModel.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 7/3/24.
//

import SwiftUI


@MainActor
final class PropertyDetailsViewModel: ObservableObject {
    let refetch: () async  -> Void
    @Binding var property: Property?
    @Published var isShowingForm = false
    
    init(refetch: @escaping () async -> Void, property: Binding<Property?>) {
        self.refetch = refetch
        self._property = property
    }
}
