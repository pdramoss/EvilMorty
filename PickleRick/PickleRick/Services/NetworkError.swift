//
//  NetworkError.swift
//  PickleRick
//
//  Created by Pedro Ramos on 2/02/23.
//

import Foundation

enum NetworkError: LocalizedError, Equatable {
    case badURL
    case noData
    case parseFail
    
    var errorDescription: String? {
        switch self {
        case .badURL: return "URL FAILED"
        case .noData: return "DATA NOT EXIST"
        case .parseFail: return "PARSE FAIL"
        }
    }
}
