//
//  PropsMap.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 1/3/24.
//

import SwiftUI
import MapKit

struct PropsMapView: View {
    @StateObject private var viewModel = PropsMapViewModel()
    
    var body: some View {
        VStack {
            Map {
                ForEach(viewModel.locations) { location in
                    Marker(location.name, coordinate: CLLocationCoordinate2D(latitude: location.latitude,
                                                                             longitude: location.longitude))
                }
            }
        }
        .frame(height: 250)
        .task {
            await viewModel.getLocations()
        }
    }
}

#Preview {
    PropsMapView()
}
