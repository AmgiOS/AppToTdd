//
//  AppToTddTests.swift
//  AppToTddTests
//
//  Created by Amg on 30/08/2019.
//  Copyright © 2019 Amg-Gauthier. All rights reserved.
//

import XCTest
@testable import AppToTdd

class AppToTddTests: XCTestCase {
    //MARK: - Test Quote
    func testGivenGetQuote_WhenShouldPostFailedCallback_ThenError() {
        //Given
        let quoteService = QuoteService(
            quoteSession: URLSessionFake(data: nil, response: nil, error: FakeResponseData.error),
            imageSession: URLSessionFake(data: nil, response: nil, error: nil))
        //When
        let expectation = XCTestExpectation(description: "Wait for queue change")
        quoteService.getQuote { (success, quote) in
            // Then
            XCTAssertFalse(success)
            XCTAssertNil(quote)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testGivenGetQuote_WhenShouldPostFailedResponse_ThenError() {
        //Given
        let quoteService = QuoteService(
            quoteSession: URLSessionFake(data: FakeResponseData.quoteCorrectData, response: FakeResponseData.responseKO, error: nil),
            imageSession: URLSessionFake(data: nil, response: nil, error: nil))
        //When
        let expectation = XCTestExpectation(description: "Wait for queue change")
        quoteService.getQuote { (success, quote) in
            // Then
            XCTAssertFalse(success)
            XCTAssertNil(quote)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testGivenGetQuote_WhenShouldPostFailedData_ThenError() {
        //Given
        let quoteService = QuoteService(
            quoteSession: URLSessionFake(data: FakeResponseData.quoteIncorrectData, response: FakeResponseData.responseOK, error: nil),
            imageSession: URLSessionFake(data: nil, response: nil, error: nil))
        //When
        let expectation = XCTestExpectation(description: "Wait for queue change")
        quoteService.getQuote { (success, quote) in
            // Then
            XCTAssertFalse(success)
            XCTAssertNil(quote)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testGivenGetQuote_WhenShouldPostSuccess_ThenSuccess() {
        //Given
        let quoteService = QuoteService(
            quoteSession: URLSessionFake(data: FakeResponseData.quoteCorrectData, response: FakeResponseData.responseOK, error: nil),
            imageSession: URLSessionFake(data: nil, response: nil, error: nil))
        //When
        let expectation = XCTestExpectation(description: "Wait for queue change")
        quoteService.getQuote { (success, quote) in
            // Then
            XCTAssertTrue(success)
            XCTAssertNotNil(quote)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 0.01)
    }
    
    
    //MARK: - Test Image
    func testGivenGetImage_WhenShouldPostFailed_ThenError() {
        //Given
        let quoteService = QuoteService(
            quoteSession: URLSessionFake(data: nil, response: nil, error: nil),
            imageSession: URLSessionFake(data: nil, response: nil, error: FakeResponseData.error))
        //When
        let expectation = XCTestExpectation(description: "Wait for queue change")
        quoteService.getImage { (success, image) in
            XCTAssertFalse(success)
            XCTAssertNil(image)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testGivenGetImage_WhenShouldPostFailedResponse_ThenError() {
        //Given
        let quoteService = QuoteService(
            quoteSession: URLSessionFake(data: nil, response: nil, error: nil),
            imageSession: URLSessionFake(data: FakeResponseData.imageData, response: FakeResponseData.responseKO, error: nil))
        //When
        let expectation = XCTestExpectation(description: "Wait for queue change")
        quoteService.getImage { (success, image) in
            XCTAssertFalse(success)
            XCTAssertNil(image)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testGivenGetImage_WhenShouldPostFailedData_ThenError() {
        //Given
        let quoteService = QuoteService(
            quoteSession: URLSessionFake(data: nil, response: nil, error: nil),
            imageSession: URLSessionFake(data: nil, response: FakeResponseData.responseOK, error: nil))
        //When
        let expectation = XCTestExpectation(description: "Wait for queue change")
        quoteService.getImage { (success, image) in
            XCTAssertFalse(success)
            XCTAssertNil(image)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testGivenGetImage_WhenShouldPostSuccess_ThenSuccess() {
        //Given
        let quoteService = QuoteService(
            quoteSession: URLSessionFake(data: nil, response: nil, error: nil),
            imageSession: URLSessionFake(data: FakeResponseData.imageData, response: FakeResponseData.responseOK, error: nil))
        //When
        let expectation = XCTestExpectation(description: "Wait for queue change")
        quoteService.getImage { (success, image) in
            XCTAssertTrue(success)
            XCTAssertNotNil(image)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 0.01)
    }
}

