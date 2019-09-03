//
//  FakeResponseData.swift
//  AppToTddTests
//
//  Created by Amg on 03/09/2019.
//  Copyright © 2019 Amg-Gauthier. All rights reserved.
//

import Foundation

class FakeResponseData {
    
    //MARK: - Fake Response
    static let responseOK = HTTPURLResponse(url: URL(string: "https://openclassrooms.com")!, statusCode: 200, httpVersion: nil, headerFields: nil)!
    static let responseKO = HTTPURLResponse(url: URL(string: "https://openclassrooms.com")!, statusCode: 500, httpVersion: nil, headerFields: nil)!
    
    //MARK: - Fake Error
    class QuoteError: Error {}
    static let error = QuoteError()
    
    //MARK: - Correct Data
    static var quoteCorrectData: Data {
        let bundle = Bundle(for: FakeResponseData.self)
        
        let url = bundle.url(forResource: "Quote", withExtension: "json")
        
        let data = try! Data(contentsOf: url!)
        return data
    }
    
    //MARK: - Fake Incorrect Data
    static let quoteIncorrectData = "erreur".data(using: .utf8)!
    
    static let imageData = "image".data(using: .utf8)!
    
}
