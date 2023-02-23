//
//  CharacterBoundsCellView.swift
//  PickleRick
//
//  Created by Pedro Ramos on 8/03/23.
//

import SwiftUI

struct CharacterBoundsCellView: View {
    let character: CharacterResponse
    
    @ViewBuilder
    var body: some View {
        ZStack(alignment: .top) {
            URLImage(urlString: character.image)
                .scaledToFit()
                .frame(width: 200, height: 200)
                .alignmentGuide(VerticalAlignment.top) { $0[VerticalAlignment.center] }
                .aspectRatio(contentMode: .fit)
                .clipShape(Circle())
                .shadow(radius: 10)
                .overlay(
                    Circle()
                        .stroke(Color.black, lineWidth: 5)
                )
                .zIndex(1)
            
            VStack {
                Text(character.name)
                    .font(.system(size: 28))
                    .bold()
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity)
                    .padding(.top, 100)
                
                Text(character.status.rawValue)
                    .foregroundColor(.black)
                    .font(.system(size: 22))
                    .fontWeight(.heavy)
            }
            .padding()
            .background {
                Color.white
            }
            .cornerRadius(8)
            .shadow(radius: 5, x: 5, y: 5)
        }
        .padding(10)
    }
    
    /**
     ZStack {
     ScrollView {
     VStack {
     resultView
     .padding()
     .padding(.top, 80)
     resultView
     .padding()
     .padding(.top, 80)
     }
     }
     }
     */
}

struct CharacterBoundsListView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterBoundsCellView(character: CharacterResponse(
            id: 1, name: "Rick",
            image: "alpha",
            status: .dead))
        .previewLayout(PreviewLayout.sizeThatFits)
    }
}
