//
//  CharacterServiceTest.swift
//  PickleRickTests
//
//  Created by Pedro Ramos on 2/02/23.
//

import XCTest
@testable import PickleRick

final class CharacterServiceTest: XCTestCase {
    private var sut: CharacterService!
    
    override func setUp() {
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        let urlSession = URLSession(configuration: config)
        sut = CharacterService(urlSession: urlSession)
    }
    
    override func tearDown() {
        sut = nil
        MockURLProtocol.stubResponseData = nil
        MockURLProtocol.error = nil
    }
    
    func testAllCharactersService_WhenSuccessResponse_ReturnSuccess() {
        MockURLProtocol.stubResponseData = jsonCharactersString.data(using: .utf8)
        let expectation = self.expectation(description: "Characters Web Service Response Expectation")
        
        sut.getAllCharacters { result in
            switch result {
            case let .success(characters):
                XCTAssertEqual(characters.count, 2)
                expectation.fulfill()
            case let .failure(error):
                XCTFail("Expected to be a success but got a failure with \(error)")
            }
        }
        self.wait(for: [expectation], timeout: 5)
    }
    
    func testDetailCharacterService_WhenSuccessResponse_ReturnSuccess() {
        MockURLProtocol.stubResponseData = jsonDetailCharacterString.data(using: .utf8)
        let expectation = self.expectation(description: "Characters Web Service Response Expectation")
        
        sut.getCharacter(100) { result in
            switch result {
            case let .success(detail):
                XCTAssertEqual(detail.id, 100)
                XCTAssertEqual(detail.status, .dead)
                XCTAssertEqual(detail.gender, .unknown)
                expectation.fulfill()
            case let .failure(error):
                XCTFail("Expected to be a success but got a failure with \(error)")
            }
        }
        self.wait(for: [expectation], timeout: 5)
    }
    
    func testAllCharactersService_WhenURLEmpty_ReturnError() {
        sut = CharacterService(urlString: "")
        let expectation = self.expectation(description: "Characters Web Service Response Expectation")
        
        sut.getAllCharacters { result in
            switch result {
            case let .success(characters):
                XCTFail("Expected to be a failure but got a success with \(characters)")
            case let .failure(error):
                XCTAssertEqual(error.localizedDescription, NetworkError.badURL.localizedDescription)
                expectation.fulfill()
            }
        }
        self.wait(for: [expectation], timeout: 5)
    }
    
    func testDetailCharacterService_WhenURLEmpty_ReturnError() {
        sut = CharacterService(urlString: "")
        let expectation = self.expectation(description: "Characters Web Service Response Expectation")
        
        sut.getCharacter(100) { result in
            switch result {
            case let .success(characters):
                XCTFail("Expected to be a failure but got a success with \(characters)")
            case let .failure(error):
                XCTAssertEqual(error.localizedDescription, NetworkError.badURL.localizedDescription)
                expectation.fulfill()
            }
        }
        self.wait(for: [expectation], timeout: 5)
    }
    
    func testAllCharactersService_WhenParseFail_ReturnError() {
        MockURLProtocol.stubResponseData = "jsonString".data(using: .utf8)
        let expectation = self.expectation(description: "Characters Web Service Response Expectation")
        
        sut.getAllCharacters { result in
            switch result {
            case let .success(characters):
                XCTFail("Expected to be a failure but got a success with \(characters)")
            case let .failure(error):
                XCTAssertEqual(error.localizedDescription, NetworkError.parseFail.localizedDescription)
                expectation.fulfill()
            }
        }
        self.wait(for: [expectation], timeout: 5)
    }
    
    func testDetailCharacterService_WhenParseFail_ReturnError() {
        MockURLProtocol.stubResponseData = "jsonString".data(using: .utf8)
        let expectation = self.expectation(description: "Characters Web Service Response Expectation")
        
        sut.getCharacter(100) { result in
            switch result {
            case let .success(characters):
                XCTFail("Expected to be a failure but got a success with \(characters)")
            case let .failure(error):
                XCTAssertEqual(error.localizedDescription, NetworkError.parseFail.localizedDescription)
                expectation.fulfill()
            }
        }
        self.wait(for: [expectation], timeout: 5)
    }
    
    func testAllCharactersService_WhenDataIsNil_ReturnError() {
        MockURLProtocol.error = Test.failure
        let expectation = self.expectation(description: "Characters Web Service Response Expectation")
        
        sut.getAllCharacters { result in
            switch result {
            case let .success(characters):
                XCTFail("Expected to be a failure but got a success with \(characters)")
            case let .failure(error):
                XCTAssertEqual(error.localizedDescription, NetworkError.noData.localizedDescription)
                expectation.fulfill()
            }
        }
        self.wait(for: [expectation], timeout: 5)
    }
    
    func testDetailCharacterService_WhenDataIsNil_ReturnError() {
        MockURLProtocol.error = Test.failure
        let expectation = self.expectation(description: "Characters Web Service Response Expectation")
        
        sut.getCharacter(100) { result in
            switch result {
            case let .success(characters):
                XCTFail("Expected to be a failure but got a success with \(characters)")
            case let .failure(error):
                XCTAssertEqual(error.localizedDescription, NetworkError.noData.localizedDescription)
                expectation.fulfill()
            }
        }
        self.wait(for: [expectation], timeout: 5)
    }
    
    private enum Test: Error {
        case failure
    }
    
    private let jsonCharactersString = """
{
    "info": {
        "count": 826,
        "pages": 42,
        "next": "https://rickandmortyapi.com/api/character?page=2",
        "prev": null
    },
    "results": [
        {
            "id": 1,
            "name": "Rick",
            "status": "Alive",
            "species": "Human",
            "type": "",
            "gender": "Male",
            "origin": {
                "name": "Earth (C-137)",
                "url": "https://rickandmortyapi.com/api/location/1"
            },
            "location": {
                "name": "Citadel of Ricks",
                "url": "https://rickandmortyapi.com/api/location/3"
            },
            "image": "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
            "episode": [
                "https://rickandmortyapi.com/api/episode/1"
            ],
            "url": "https://rickandmortyapi.com/api/character/1",
            "created": "2017-11-04T18:48:46.250Z"
        },
        {
            "id": 2,
            "name": "Morty Smith",
            "status": "Dead",
            "species": "Alien",
            "type": "",
            "gender": "Female",
            "origin": {
                "name": "unknown",
                "url": ""
            },
            "location": {
                "name": "Citadel of Ricks",
                "url": "https://rickandmortyapi.com/api/location/3"
            },
            "image": "https://rickandmortyapi.com/api/character/avatar/2.jpeg",
            "episode": [
                "https://rickandmortyapi.com/api/episode/1",
                "https://rickandmortyapi.com/api/episode/2"
            ],
            "url": "https://rickandmortyapi.com/api/character/2",
            "created": "2017-11-04T18:50:21.651Z"
        }
    ]
}
"""
    
    private let jsonDetailCharacterString = """
{
    "id": 100,
    "name": "Bubonic Plague",
    "status": "Dead",
    "species": "Disease",
    "type": "",
    "gender": "unknown",
    "origin": {
        "name": "Anatomy Park",
        "url": "https://rickandmortyapi.com/api/location/5"
    },
    "location": {
        "name": "Anatomy Park",
        "url": "https://rickandmortyapi.com/api/location/5"
    },
    "image": "https://rickandmortyapi.com/api/character/avatar/100.jpeg",
    "episode": [
        "https://rickandmortyapi.com/api/episode/3"
    ],
    "url": "https://rickandmortyapi.com/api/character/100",
    "created": "2017-12-01T12:02:21.611Z"
}
"""
}
