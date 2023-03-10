//
//  PickleRickApp.swift
//  PickleRick
//
//  Created by Pedro Ramos on 1/02/23.
//

import SwiftUI

@main
struct PickleRickApp: App {
    var body: some Scene {
        WindowGroup {
            CharacterListScreen()
                .preferredColorScheme(.dark)
        }
    }
}
