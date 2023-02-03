//
//  CharacterDetailViewModelTest.swift
//  PickleRickTests
//
//  Created by Pedro Ramos on 2/02/23.
//

import XCTest
@testable import PickleRick

final class CharacterDetailViewModelTest: XCTestCase {

    private var sut: CharacterDetailViewModel!
    private var service: MockCharactersServices!

    override func setUp() {
        service = MockCharactersServices()
        sut = CharacterDetailViewModel(service: service)
    }

    override func tearDown() {
        service = nil
        sut = nil
    }
    
    func testCallService_WhenResultIsSuccess_StateSuccess() {
        service.characterId = CharacterDetailResponse(id: 1,
                                                      name: "Bubonic Plague",
                                                      status: .alive,
                                                      species: .human,
                                                      type: "",
                                                      gender: .female,
                                                      origin: CharacterOriginResponse(name: "name", url: "url"),
                                                      location: CharacterOriginResponse(name: "name", url: "url"),
                                                      image: "image",
                                                      created: "created")
        sut.getDetail(100)
        
        XCTAssertEqual(sut.loadingState, .success)
    }
    
    func testCallService_WhenResultIsFailed_StateFailed() {
        service.error = .parseFail
        
        sut.getDetail(100)
        
        XCTAssertEqual(sut.loadingState, .failed)
    }
}
