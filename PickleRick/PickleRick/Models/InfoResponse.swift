//
//  InfoResponse.swift
//  PickleRick
//
//  Created by Pedro Ramos on 2/02/23.
//

import Foundation

struct InfoResponse: Codable {
    var count: Int
    var pages: Int
    var next: String?
    var prev: String?
}
