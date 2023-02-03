//
//  MockCharactersServices.swift
//  PickleRickTests
//
//  Created by Pedro Ramos on 2/02/23.
//

import XCTest
@testable import PickleRick

final class MockCharactersServices: CharactersServiceProtocol {
    var characters: [CharacterResponse]?
    var characterId: CharacterDetailResponse?
    var error: NetworkError?
    
    func getAllCharacters(completion: @escaping (Result<[CharacterResponse], NetworkError>) -> Void) {
        if let characters = characters {
            completion(.success(characters))
        }
        
        if let error = error {
            completion(.failure(error))
        }
    }
    
    func getCharacter(_ id: Int, completion: @escaping (Result<CharacterDetailResponse, NetworkError>) -> Void) {
        if let characterId = characterId {
            completion(.success(characterId))
        }
        
        if let error = error {
            completion(.failure(error))
        }
    }
}
