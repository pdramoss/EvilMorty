//
//  View+Extensions.swift
//  PickleRick
//
//  Created by Pedro Ramos on 2/02/23.
//

import Foundation
import SwiftUI

extension View {
    func embedNavigationView() -> some View {
        NavigationView { self }
    }
}
