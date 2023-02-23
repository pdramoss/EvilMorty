//
//  CharacterListView.swift
//  PickleRick
//
//  Created by Pedro Ramos on 2/02/23.
//

import SwiftUI

struct CharacterListView: View {
    let characters: [CharacterResponse]
    
    var body: some View {
        List(self.characters, id: \.id) { character in
            NavigationLink(destination: CharacterDetailScreen(character.id)) {
                CharacterBoundsCellView(character: character)
            }
        }
    }
}

struct CharacterCell: View {
    let character: CharacterResponse
    
    var body: some View {
        HStack {
            VStack {
                Text(character.name)
                    .font(.system(size: 28, weight: .heavy, design: .rounded))
                HStack {
                    Spacer()
                    Text(character.status.rawValue)
                    Spacer()
                }
                .font(.system(size: 22, weight: .medium, design: .rounded))
            }.padding(5)
        }.contentShape(Rectangle())
    }
}

struct CharacterListView_Previews: PreviewProvider {
    static var previews: some View {
        let list = [
            CharacterResponse(
                id: 1, name: "Rick",
                image: "https://rickandmortyapi.com/api/character/avatar/100.jpeg",
                status: .alive),
            CharacterResponse(
                id: 2, name: "Summer",
                image: "https://rickandmortyapi.com/api/character/avatar/100.jpeg",
                status: .dead)
        ]
        CharacterListView(characters: list)
    }
}
