//
//  PrincipalResponse.swift
//  PickleRick
//
//  Created by Pedro Ramos on 2/02/23.
//

import Foundation

struct PrincipalResponse: Codable {
    var info: InfoResponse
    var results: [CharacterResponse]
}
