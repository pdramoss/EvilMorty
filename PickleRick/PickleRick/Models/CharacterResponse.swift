//
//  CharacterResponse.swift
//  PickleRick
//
//  Created by Pedro Ramos on 2/02/23.
//

import Foundation

struct CharacterResponse: Codable {
    var id: Int
    var name: String
    var status: CharacterStatusResponse
    var species: CharacterSpeciesResponse
    var type: String
    var gender: CharacterGenderResponse
    var origin: CharacterOriginResponse
    var location: CharacterOriginResponse
    var image: String
    var created: String
}

struct CharacterOriginResponse: Codable {
    var name: String
    var url: String
}

enum CharacterStatusResponse: String, Codable {
    case alive = "alive"
    case dead = "dead"
    case unknown = "unknown"
    case none = ""
}

enum CharacterSpeciesResponse: String, Codable {
    case human = "Human"
    case alien = "Alien"
    case disease = "Disease"
    case humanoid = "Humanoid"
    case none = ""
}

enum CharacterGenderResponse: String, Codable {
    case female = "female"
    case male = "male"
    case genderless = "genderless"
    case unknown = "unknown"
    case none = ""
}
