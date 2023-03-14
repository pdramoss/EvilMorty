//
//  HeaderDetailView.swift
//  PickleRick
//
//  Created by Pedro Ramos on 14/03/23.
//

import SwiftUI

struct HeaderDetailView: View {
    let detail: CharacterDetailResponse?
    let itemWidth: CGFloat
    
    var body: some View {
        VStack {
            let imageWidth = itemWidth * (UIDevice().userInterfaceIdiom == .pad ? 0.45 : 0.65)
            URLImage(urlString: detail?.image ?? String())
                .scaledToFit()
                .frame(width: imageWidth, height: imageWidth)
                .alignmentGuide(VerticalAlignment.top) { $0[VerticalAlignment.center] }
                .aspectRatio(contentMode: .fit)
                .clipShape(RoundedRectangle(cornerRadius: 25.0))
                .shadow(radius: 10)
                .overlay(
                    RoundedRectangle(cornerRadius: 25.0)
                        .stroke(Color.black, lineWidth: 5)
                )
                .zIndex(1)
            
            VStack {
                Text(detail?.name ?? String())
                    .font(.system(size: 28))
                    .bold()
                    .foregroundColor(.black)
                    .frame(maxWidth: itemWidth)
            }
        }
    }
}
