//
//  CharacterService.swift
//  PickleRick
//
//  Created by Pedro Ramos on 2/02/23.
//

import Foundation

class CharacterService: CharactersServiceProtocol {
    private var urlSession: URLSession
    private var urlString: String
    
    init(urlString: String = Environment.baseURL, urlSession: URLSession = .shared) {
        self.urlString = urlString
        self.urlSession = urlSession
    }
    
    func getAllCharacters(completion: @escaping (Result<[CharacterResponse], NetworkError>) -> Void) {
        guard let charactersURL = URL(string: self.urlString) else {
            return completion(.failure(.badURL))
        }
        
        let dataTask = self.urlSession.dataTask(with: charactersURL) { data, _, error in
            guard let data = data, error == nil else {
                return completion(.failure(.noData))
            }
            
            do {
                let principalResponse = try JSONDecoder().decode(PrincipalResponse.self, from: data)
                Logger.info(principalResponse)
                completion(.success(principalResponse.results))
            } catch {
                Logger.error(error)
                completion(.failure(.parseFail))
            }
        }
        dataTask.resume()
    }
    
    func getCharacter(_ id: Int, completion: @escaping (Result<CharacterDetailResponse, NetworkError>) -> Void) {
        
        guard !self.urlString.isEmpty,  let charactersURL = URL(string: self.urlString + "/\(id)") else {
            return completion(.failure(.badURL))
        }
        
        let dataTask = self.urlSession.dataTask(with: charactersURL) { data, _, error in
            guard let data = data, error == nil else {
                return completion(.failure(.noData))
            }
            
            do {
                let detailResponse = try JSONDecoder().decode(CharacterDetailResponse.self, from: data)
                Logger.info(detailResponse)
                completion(.success(detailResponse))
            } catch {
                Logger.error(error)
                completion(.failure(.parseFail))
            }
        }
        dataTask.resume()
    }
}
