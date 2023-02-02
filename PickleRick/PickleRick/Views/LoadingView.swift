//
//  Loading.swift
//  PickleRick
//
//  Created by Pedro Ramos on 2/02/23.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        Image("Loading")
            .resizable()
            .frame(width: 250, height: 250, alignment: .center)
    }
}

struct Loading_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
