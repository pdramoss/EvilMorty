//
//  SectionDetailView.swift
//  PickleRick
//
//  Created by Pedro Ramos on 14/03/23.
//

import SwiftUI

struct SectionDetailView<Content>: View where Content: View {
    private let content: Content
    private let reader: GeometryProxy
    
    public init(_ reader: GeometryProxy, @ViewBuilder content: () -> Content) {
        self.reader = reader
        self.content = content()
    }
    
    var body : some View {
        VStack {
            content
        }
        .frame(maxWidth: reader.size.width)
        .padding()
        .background {
            Color.white
        }
        .cornerRadius(8)
        .shadow(radius: 5, x: 5, y: 5)
    }
}
