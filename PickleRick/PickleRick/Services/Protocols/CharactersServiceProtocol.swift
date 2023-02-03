//
//  CharactersServiceProtocol.swift
//  PickleRick
//
//  Created by Pedro Ramos on 2/02/23.
//

import Foundation

protocol CharactersServiceProtocol {
    func getAllCharacters(completion: @escaping (Result<[CharacterResponse], NetworkError>) -> Void)
    func getCharacter(_ id: Int, completion: @escaping (Result<CharacterDetailResponse, NetworkError>) -> Void)
}
