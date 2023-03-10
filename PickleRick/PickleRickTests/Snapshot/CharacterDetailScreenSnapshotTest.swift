//
//  CharacterDetailScreenSnapshotTest.swift
//  PickleRickTests
//
//  Created by Pedro Ramos on 2/02/23.
//

import XCTest
import SnapshotTesting
import SwiftUI
@testable import PickleRick

final class CharacterDetailScreenSnapshotTest: XCTestCase {
    
    private var service: MockCharactersServices!
    private var viewModel: CharacterDetailViewModel!
    private var screen: CharacterDetailScreen!
    private var isRecord: Bool = false
    
    override func setUp() {
        self.service = MockCharactersServices()
        self.viewModel = CharacterDetailViewModel(service: service)
        self.screen = CharacterDetailScreen(100, detailVM: viewModel)
    }
    
    override func tearDown() {
        self.service = nil
        self.viewModel = nil
        self.screen = nil
    }
    
    func test_ScreenSuccess() {
        self.service.characterId = CharacterDetailResponse(
            id: 1,
            name: "Bubonic Plague",
            status: .alive,
            species: "human",
            type: "",
            gender: "female",
            origin: CharacterOriginResponse(name: "origin"),
            location: CharacterOriginResponse(name: "location"),
            image: "image",
            created: "created")
        
        let vc = UIHostingController(rootView: screen)
        assertSnapshot(matching: vc, as: .image(on: .iPhone13Pro), record: isRecord)
        assertSnapshot(matching: vc, as: .image(on: .iPadPro12_9), record: isRecord)
    }
    
    func test_ScreenLoading() {
        let vc = UIHostingController(rootView: screen)
        assertSnapshot(matching: vc, as: .image(on: .iPhone13Pro), record: isRecord)
        assertSnapshot(matching: vc, as: .image(on: .iPadPro12_9), record: isRecord)
    }
    
    func test_ScreenFailed() {
        self.service.error = .badURL
        
        let vc = UIHostingController(rootView: screen)
        assertSnapshot(matching: vc, as: .image(on: .iPhone13Pro), record: isRecord)
        assertSnapshot(matching: vc, as: .image(on: .iPadPro12_9), record: isRecord)
    }
}
