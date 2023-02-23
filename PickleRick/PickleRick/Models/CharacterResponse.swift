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
    var image: String
    var status: CharacterStatusResponse
}
