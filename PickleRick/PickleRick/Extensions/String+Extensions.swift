//
//  String+Extensions.swift
//  PickleRick
//
//  Created by Pedro Ramos on 2/02/23.
//

import Foundation

extension String {
    var dateExpectedFormat: String {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "MMMM yyyy"
        
        let date = dateFormatterGet.date(from: self) ?? Date()
        return dateFormatterPrint.string(from: date)
        
    }
}
