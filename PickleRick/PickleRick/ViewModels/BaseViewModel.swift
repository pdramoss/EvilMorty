//
//  BaseViewModel.swift
//  PickleRick
//
//  Created by Pedro Ramos on 2/02/23.
//

import Foundation

enum LoadingState {
    case loading
    case success
    case failed
}

class BaseViewModel: ObservableObject {
    @Published var loadingState: LoadingState = .loading
}
