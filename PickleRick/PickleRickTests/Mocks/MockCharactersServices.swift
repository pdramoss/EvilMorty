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
    var error: NetworkError?
    
    func getAllCharacter(completion: @escaping (Result<[CharacterResponse], NetworkError>) -> Void) {
        if let characters = characters {
            completion(.success(characters))
        }
        
        if let error = error {
            completion(.failure(error))
        }
    }
}
