//
//  CharacterListViewModelTest.swift
//  PickleRickTests
//
//  Created by Pedro Ramos on 2/02/23.
//

import XCTest
@testable import PickleRick

final class CharacterListViewModelTest: XCTestCase {
    private var sut: CharacterListViewModel!
    private var service: MockCharactersServices!

    override func setUp() {
        service = MockCharactersServices()
        sut = CharacterListViewModel(service: service)
    }

    override func tearDown() {
        service = nil
        sut = nil
    }
    
    func testCallService_WhenResultIsSuccess_StateSuccess() {
        service.characters = [CharacterResponse(id: 1, name: "name", image: "Other", status: .alive)]
        
        sut.getAllCharacters()
        
        XCTAssertEqual(sut.loadingState, .success)
    }
    
    func testCallService_WhenResultIsFailed_StateFailed() {
        service.error = .parseFail
        
        sut.getAllCharacters()
        
        XCTAssertEqual(sut.loadingState, .failed)
    }
}
