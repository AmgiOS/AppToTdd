//
//  QuoteViewModel.swift
//  AppToTdd
//
//  Created by Amg on 03/09/2019.
//  Copyright © 2019 Amg-Gauthier. All rights reserved.
//

import Foundation

class QuoteViewModel {
    //MARK: - Vars
    var author: String = "" { didSet {}}
    var text: String = "" { didSet {}}
    
    //MARK: - Functions
    func getQuoteToDisplay() {
        QuoteService.shared.getQuote { (success, quote) in
            if success {
                if let quote = quote {
                    self.author = quote.author ?? ""
                    self.text = quote.text ?? ""
                    print(quote)
                }
            }
        }
    }
    
    
    
}
