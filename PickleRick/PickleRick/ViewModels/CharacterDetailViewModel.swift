//
//  CharacterDetailViewModel.swift
//  PickleRick
//
//  Created by Pedro Ramos on 2/02/23.
//

import Foundation

class CharacterDetailViewModel: BaseViewModel {
    @Published var detail: CharacterDetailResponse?
    private var service: CharactersServiceProtocol
    
    init(service: CharactersServiceProtocol = CharacterService()) {
        self.service = service
    }
    
    func getDetail(_ id: Int) {
        self.loadingState = .loading
        self.service.getCharacter(id) { [weak self] result in
            switch result {
            case let .success(detail):
                self?.detail = detail
                self?.loadingState = .success
            case let .failure(error):
                self?.loadingState = .failed
                Logger.error(error)
            }
        }
    }
}
