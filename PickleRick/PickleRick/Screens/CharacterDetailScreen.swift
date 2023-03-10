//
//  CharacterDetailScreen.swift
//  PickleRick
//
//  Created by Pedro Ramos on 2/02/23.
//

import SwiftUI

struct CharacterDetailScreen: View {
    let id: Int
    @ObservedObject private var detailVM: CharacterDetailViewModel
    
    init(_ id: Int, detailVM: CharacterDetailViewModel = CharacterDetailViewModel()) {
        self.id = id
        self.detailVM = detailVM
    }
    
    var body: some View {
        BigBaseView(state: detailVM.loadingState) {
            CharacterDetailView(detail: detailVM.detail)
                .padding(20)
                .fullBackground("background_list")
        }
        .onAppear {
            detailVM.getDetail(id)
        }
    }
}
