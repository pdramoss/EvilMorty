//
//  CharactersScreen.swift
//  PickleRick
//
//  Created by Pedro Ramos on 2/02/23.
//

import SwiftUI

struct CharacterListScreen: View {
    @ObservedObject private var charactersVM: CharacterListViewModel
    
    init(charactersVM: CharacterListViewModel = CharacterListViewModel()) {
        self.charactersVM = charactersVM
    }
    
    var body: some View {
        BigBaseView(state: self.charactersVM.loadingState) {
            CharacterListView(characters: self.charactersVM.characters)
                .navigationTitle("Characters")
        }
        .onAppear{
            self.charactersVM.getAllCharacters()
        }
        .embedNavigationView()
    }
}
