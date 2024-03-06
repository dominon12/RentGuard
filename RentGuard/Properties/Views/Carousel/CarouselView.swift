//
//  CarouselView.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 6/3/24.
//

import SwiftUI

struct CarouselView: View {
    let images: [String]
    
    var body: some View {
        AsyncImage(url: URL(string: images.first ?? "")) { image in
            image
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity, maxHeight: 300)
                .clipped()
        } placeholder: {
            Image("property-img-placeholder")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity, maxHeight: 264)
        }
        .background(.secondary.opacity(0.15))
    }
}

#Preview {
    CarouselView(images: PropertyMockData.sampleProperty.images)
}
