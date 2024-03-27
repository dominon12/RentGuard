//
//  CarouselView.swift
//  RentGuard
//
//  Created by Maksim Sobolev on 6/3/24.
//

import SwiftUI

struct CarouselView: View {
    let images: [String]
    @State private var selectedImageIndex: Int = 0
    
    var body: some View {
        ZStack {
            Color.secondary.opacity(0.15)
            
            let imagesToRender = images.isEmpty ? [""] : images

            TabView(selection: $selectedImageIndex) {
                ForEach(0..<imagesToRender.count, id: \.self) { index in
                    ZStack(alignment: .topLeading) {
                        AsyncImage(url: URL(string: imagesToRender[index])) { image in
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
                    }
                }
            }
            .frame(height: 300)
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))

            if imagesToRender.count > 1 {
                HStack {
                    ForEach(0..<imagesToRender.count, id: \.self) { index in
                        Capsule()
                            .fill(Color.white.opacity(selectedImageIndex == index ? 1 : 0.33))
                            .frame(width: 35, height: 8)
                            .onTapGesture {
                                selectedImageIndex = index
                            }
                    }
                    .offset(y: 130)
                }
            }
        }
        .frame(maxHeight: 300)
    }
}

#Preview {
    CarouselView(images: PropertyMockData.sampleProperty.images)
}
