//
//  Logger.swift
//  PickleRick
//
//  Created by Pedro Ramos on 2/02/23.
//

import Foundation

final class Logger: LoggerProtocol {
    static func error(_ object: Any, filename: String = #file, functionName: String = #function) {
        print("\(LoggerEvent.error.rawValue) :: [\(sourceFileName(filePath: filename))]: \(functionName) ->", with: object)
    }
    
    static func info(_ object: Any, filename: String = #file, functionName: String = #function) {
        print("\(LoggerEvent.info.rawValue) :: [\(sourceFileName(filePath: filename))]: \(functionName) ->", with: object)
    }
}
