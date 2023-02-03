//
//  CharacterDetailView.swift
//  PickleRick
//
//  Created by Pedro Ramos on 2/02/23.
//

import SwiftUI

struct CharacterDetailView: View {
    let detail: CharacterDetailResponse?
    
    var body: some View {
        VStack (alignment: .leading) {
            if UIDevice().userInterfaceIdiom == .pad {
                HeaderIpad(detail: detail)
            } else {
                HeaderIphone(detail: detail)
            }
            BodyDetail(detail: detail)
                .padding(.top, 30)
            Spacer()
        }
    }
}

fileprivate struct HeaderIphone: View {
    let detail: CharacterDetailResponse?
    
    var body: some View {
        VStack {
            URLImage(urlString: detail?.image ?? String())
                .frame(width: 200, height: 200, alignment: .center)
                .cornerRadius(12)
            Text(detail?.name ?? String())
                .font(.system(size: 38, weight: .heavy, design: .rounded))
            HStack {
                Text("Gender: " + (detail?.gender.emoji ?? String()))
                    .font(.system(size: 26, weight: .bold, design: .rounded))
                Text("Status: " + (detail?.status.rawValue ?? String()))
                    .font(.system(size: 26, weight: .bold, design: .rounded))
            }
            Text("Created: " + (detail?.created.dateExpectedFormat ?? String()))
                .font(.system(size: 20, weight: .bold, design: .rounded))
        }
    }
}

fileprivate struct HeaderIpad: View {
    let detail: CharacterDetailResponse?
    
    var body: some View {
        HStack {
            URLImage(urlString: detail?.image ?? String())
                .frame(width: 300, height: 300, alignment: .center)
                .cornerRadius(12)
                .padding(.trailing, 60)
            VStack {
                Text(detail?.name ?? String())
                    .font(.system(size: 48, weight: .heavy, design: .rounded))
                Text("Gender: " + (detail?.gender.emoji ?? String()))
                    .font(.system(size: 40, weight: .bold, design: .rounded))
                Text("Status: " + (detail?.status.rawValue ?? String()))
                    .font(.system(size: 40, weight: .bold, design: .rounded))
                Text("Created: " + (detail?.created.dateExpectedFormat ?? String()))
                    .font(.system(size: 32, weight: .bold, design: .rounded))
            }
        }
    }
}

fileprivate struct BodyDetail: View {
    let detail: CharacterDetailResponse?
    
    private var textSize: CGFloat {
        return UIDevice().userInterfaceIdiom == .pad ? 50 : 24
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Species: " + (detail?.species.rawValue ?? String()))
            Text("Origin: " + (detail?.origin.name ?? String()))
            Text("Location: " + (detail?.location.name ?? String()))
        }
        .font(.system(size: textSize, weight: .bold, design: .rounded))
    }
}

struct CharacterDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let detail = CharacterDetailResponse(
            id: 1,
            name: "Bubonic Plague",
            status: .alive,
            species: .human,
            type: "",
            gender: .female,
            origin: CharacterOriginResponse(name: "name", url: "url"),
            location: CharacterOriginResponse(name: "name", url: "url"),
            image: "https://rickandmortyapi.com/api/character/avatar/100.jpeg",
            created: "created")
        
        Group {
            CharacterDetailView(detail: detail)
                .previewDevice("iPad Pro (12.9-inch) (6th generation)")
                .previewLayout(.device)
                .padding()
                .previewDisplayName("IPAD preview")
            CharacterDetailView(detail: detail)
                .previewDevice("iPhone 13 Pro")
                .previewLayout(.device)
                .padding()
                .previewDisplayName("IPHONE preview")
        }
        
    }
}
