//
//  DescriptionDetailView.swift
//  PickleRick
//
//  Created by Pedro Ramos on 14/03/23.
//

import SwiftUI

struct DescriptionDetailView: View {
    private let state: String
    private let information: String
    
    public init(_ state: String, information: String? = nil) {
        self.state = state
        self.information = (information ?? "unknown").uppercased()
    }
    
    var body: some View {
        HStack {
            Text("- \(state): ")
                .font(.system(size: 20))
                .bold()
                .foregroundColor(.black)
            Spacer()
            Text(information.isEmpty ? "NA / NR" : information)
                .font(.system(size: 16))
                .foregroundColor(.gray)
        }
    }
}
