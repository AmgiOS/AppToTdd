//
//  QuoteService.swift
//  AppToTdd
//
//  Created by Amg on 30/08/2019.
//  Copyright © 2019 Amg-Gauthier. All rights reserved.
//

import Foundation

class QuoteService {
    
    //MARK: - Vars
    private let quoteUrl = URL(string: "https://api.forismatic.com/api/1.0/")!
    private let pictureUrl = URL(string: "https://source.unsplash.com/random/1000x1000")!
    
    private var task: URLSessionTask?
    
    private var quoteSession = URLSession(configuration: .default)
    private var imageSession = URLSession(configuration: .default)
    
    init(quoteSession: URLSession, imageSession: URLSession) {
        self.quoteSession = quoteSession
        self.imageSession = imageSession
    }
    
    //MARK: - Functions
    func createSession() -> URLRequest {
        var request = URLRequest(url: quoteUrl)
        request.httpMethod = "POST"
        
        let body = "method=getQuote&format=json&lang=en"
        request.httpBody = body.data(using: .utf8)
        
        return request
    }
    
    func getQuote(callback: @escaping (Bool, Quote?) -> Void) {
        task?.cancel()
        
        task = quoteSession.dataTask(with: createSession(), completionHandler: { (data, response, error) in
            
            DispatchQueue.main.async {
                guard let data = data, error == nil else {
                    callback(false, nil)
                    print("Error data or \(error?.localizedDescription ?? "")")
                    return
                }
                
                guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                    callback(false, nil)
                    print("error status code")
                    return
                }
                
                guard let responseJSON = try? JSONDecoder().decode(Quote.self, from: data) else {
                    callback(false, nil)
                    return
                }
                print(responseJSON)
                callback(true, responseJSON)
            }
            
        })
        task?.resume()
        
    }
    
    private func getImage(completionHandler: @escaping (Data?) -> Void) {
        task?.cancel()
        
        task = imageSession.dataTask(with: pictureUrl) { (data, response, error) in
            DispatchQueue.main.async {
                guard let data = data, error == nil else {
                    completionHandler(nil)
                    return
                }
                guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                    completionHandler(nil)
                    return
                }
                completionHandler(data)
            }
        }
        task?.resume()
    }
}
