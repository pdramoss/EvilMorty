//
//  BigBaseView.swift
//  PickleRick
//
//  Created by Pedro Ramos on 2/02/23.
//

import SwiftUI

struct BigBaseView<Content>: View where Content: View {
    private let state: LoadingState = .loading
    private let content: Content
    
    public init(state: LoadingState, @ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body : some View {
        ZStack {
            switch state {
            case .loading:
                LoadingView()
            case .failed:
                FailedView()
            case .success:
                content
            }
        }
    }
}
