//
//  CharactersSummaryViewModel.swift
//  PickleRick
//
//  Created by Pedro Ramos on 2/02/23.
//

import Foundation

class CharacterListViewModel: BaseViewModel {
    @Published var characters: [CharacterResponse] = [CharacterResponse]()
    private var service: CharactersServiceProtocol
    
    init(service: CharactersServiceProtocol = CharacterService()) {
        self.service = service
    }
    
    func getAllCharacters() {
        self.loadingState = .loading
        self.service.getAllCharacter { [weak self] result in
            switch result {
            case let .success(characters):
                self?.characters = characters
                self?.loadingState = .success
            case let .failure(error):
                Logger.error(error)
                self?.loadingState = .failed
            }
        }
    }
}
