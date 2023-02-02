//
//  CharactersServiceProtocol.swift
//  PickleRick
//
//  Created by Pedro Ramos on 2/02/23.
//

import Foundation

protocol CharactersServiceProtocol {
    func getAllCharacter(completion: @escaping (Result<[CharacterResponse], NetworkError>) -> Void)
}
