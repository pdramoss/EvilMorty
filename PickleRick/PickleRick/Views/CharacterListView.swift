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
                CharacterCell(character: character)
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
                    Text(character.gender.emoji)
                    Spacer()
                }
                .font(.system(size: 22, weight: .medium, design: .rounded))
                HStack {
                    Text("Created: ")
                    Text(character.created.dateExpectedFormat)
                }
                .font(.system(size: 16, weight: .medium, design: .rounded))
            }.padding(5)
        }.contentShape(Rectangle())
    }
}

struct CharacterListView_Previews: PreviewProvider {
    static var previews: some View {
        let list = [
            CharacterResponse(id: 1, name: "Rick", status: .alive, gender: .male, created: "Some Day"),
            CharacterResponse(id: 2, name: "Summer", status: .dead, gender: .female, created: "Some Day")
        ]
        CharacterListView(characters: list)
    }
}
