//
//  CharacterDetailResponse.swift
//  PickleRick
//
//  Created by Pedro Ramos on 2/02/23.
//

import Foundation

struct CharacterDetailResponse: Codable {
    var id: Int
    var name: String
    var status: CharacterStatusResponse
    var species: String
    var type: String
    var gender: String
    var origin: CharacterOriginResponse
    var location: CharacterOriginResponse
    var image: String
    var created: String
}

struct CharacterOriginResponse: Codable {
    var name: String
}

enum CharacterStatusResponse: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
    case none = ""
}
