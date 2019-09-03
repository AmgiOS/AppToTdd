//
//  QuoteViewModel.swift
//  AppToTdd
//
//  Created by Amg on 03/09/2019.
//  Copyright © 2019 Amg-Gauthier. All rights reserved.
//

import Foundation

class QuoteViewModel {
    //MARK: - Functions
    func getQuoteToDisplay(completion: @escaping (String, String) -> Void) {
        QuoteService.shared.getQuote { (success, quote) in
            if success {
                if let quote = quote {
                   completion(quote.author ?? "", quote.text ?? "")
                }
            }
        }
    }
    
    func getRandomImage(completion: @escaping (Data) -> Void) {
        QuoteService.shared.getImage { (success, image) in
            if success {
                if let image = image {
                    completion(image)
                }
            }
        }
    }
}
