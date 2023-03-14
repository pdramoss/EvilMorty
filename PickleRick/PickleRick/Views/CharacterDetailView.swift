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
