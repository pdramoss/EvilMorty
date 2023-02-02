//
//  FailedView.swift
//  PickleRick
//
//  Created by Pedro Ramos on 2/02/23.
//

import SwiftUI

struct FailedView: View {
    var body: some View {
        Image("Failed")
            .resizable()
            .frame(width: 250, height: 250, alignment: .center)
    }
}

struct FailedView_Previews: PreviewProvider {
    static var previews: some View {
        FailedView()
    }
}
