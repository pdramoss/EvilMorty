//
//  URLImage.swift
//  PickleRick
//
//  Created by Pedro Ramos on 2/02/23.
//

import SwiftUI

struct URLImage: View {
    @ObservedObject var imageLoader = ImageLoader()
    let url: String
    let placeholder: String
    
    init(url: String, placeholder: String = "placeholder") {
        self.url = url
        self.placeholder = placeholder
        self.imageLoader.downloadImage(url: self.url)
    }
    
    var body: some View {
        guard let data = self.imageLoader.downloadedData, let uiImage = UIImage(data: data) else {
            return Image("Warning")
                .resizable()
        }
        return Image(uiImage: uiImage)
            .resizable()
            
    }
}
