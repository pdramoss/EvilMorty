//
//  CharacterListScreenSnapshotTest.swift
//  PickleRickTests
//
//  Created by Pedro Ramos on 2/02/23.
//

import XCTest
import SnapshotTesting
import SwiftUI
@testable import PickleRick

final class CharacterListScreenSnapshotTest: XCTestCase {

    private var service: MockCharactersServices!
    private var viewModel: CharacterListViewModel!
    private var screen: CharacterListScreen!
    
    override func setUp() {
        self.service = MockCharactersServices()
        self.viewModel = CharacterListViewModel(service: service)
        self.screen = CharacterListScreen(charactersVM: viewModel)
    }

    override func tearDown() {
        self.service = nil
        self.viewModel = nil
        self.screen = nil
    }
    
    func test_ScreenSuccess() {
        self.service.characters = [CharacterResponse(id: 1, name: "name", status: .alive, gender: .male, created: "Some days")]
        
        let vc = UIHostingController(rootView: screen)
        assertSnapshot(matching: vc, as: .image(on: .iPhone13Pro))
        assertSnapshot(matching: vc, as: .image(on: .iPadPro12_9))
    }
    
    func test_ScreenLoading() {
        let vc = UIHostingController(rootView: screen)
        assertSnapshot(matching: vc, as: .image(on: .iPhone13Pro))
        assertSnapshot(matching: vc, as: .image(on: .iPadPro12_9))
    }
    
    func test_ScreenFailed() {
        self.service.error = .badURL
        
        let vc = UIHostingController(rootView: screen)
        assertSnapshot(matching: vc, as: .image(on: .iPhone13Pro))
        assertSnapshot(matching: vc, as: .image(on: .iPadPro12_9))
    }
}
