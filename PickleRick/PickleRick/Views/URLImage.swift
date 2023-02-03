//
//  URLImage.swift
//  PickleRick
//
//  Created by Pedro Ramos on 2/02/23.
//

import SwiftUI

struct URLImage: View {
    private let urlString: String
    
    init(urlString: String) {
        self.urlString = urlString
    }
    
    var body: some View {
        AsyncImage(url: URL(string: urlString)) { image in
            image
                .resizable()
        } placeholder: {
            Image("Warning")
                .resizable()
        }
    }
}
