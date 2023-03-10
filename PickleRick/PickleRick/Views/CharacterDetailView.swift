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
        GeometryReader { reader in
            ScrollView(.vertical) {
                VStack {
                    SectionDetailView(reader) {
                        HeaderDetailView(detail: detail, itemWidth: reader.size.width)
                    }
                    SectionDetailView(reader) {
                        DescriptionDetailView("Status", information: detail?.status.rawValue)
                        DescriptionDetailView("Species", information: detail?.species)
                        DescriptionDetailView("Type", information: detail?.type)
                        DescriptionDetailView("Gender", information: detail?.gender)
                    }
                    SectionDetailView(reader) {
                        DescriptionDetailView("Origin", information: detail?.origin.name)
                        DescriptionDetailView("Location", information: detail?.location.name)
                    }
                    SectionDetailView(reader) {
                        DescriptionDetailView("Created", information: detail?.created.dateExpectedFormat)
                    }
                    Spacer(minLength: 20)
                }.frame(maxWidth: reader.size.width, maxHeight: .infinity)
            }
        }
    }
}

fileprivate struct DescriptionDetailView: View {
    private let state: String
    private let information: String
    
    public init(_ state: String, information: String? = nil) {
        self.state = state
        self.information = (information ?? "unknown").uppercased()
    }
    
    var body: some View {
        HStack {
            Text("- \(state): ")
                .font(.system(size: 20))
                .bold()
                .foregroundColor(.black)
            Spacer()
            Text(information.isEmpty ? "NA / NR" : information)
                .font(.system(size: 16))
                .foregroundColor(.gray)
        }
    }
}

fileprivate struct HeaderDetailView: View {
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

fileprivate struct SectionDetailView<Content>: View where Content: View {
    private let content: Content
    private let reader: GeometryProxy
    
    public init(_ reader: GeometryProxy, @ViewBuilder content: () -> Content) {
        self.reader = reader
        self.content = content()
    }
    
    var body : some View {
        VStack {
            content
        }
        .frame(maxWidth: reader.size.width)
        .padding()
        .background {
            Color.white
        }
        .cornerRadius(8)
        .shadow(radius: 5, x: 5, y: 5)
    }
}


struct CharacterDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let detail = CharacterDetailResponse(
            id: 1,
            name: "Rick Sanchez",
            status: .alive,
            species: "Human",
            type: "",
            gender: "Male",
            origin: CharacterOriginResponse(name: "Earth (C-137)"),
            location: CharacterOriginResponse(name: "Citadel of Ricks"),
            image: "some",
            created: "2017-11-04T18:48:46.250Z")
        
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
