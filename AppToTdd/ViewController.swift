//
//  ViewController.swift
//  AppToTdd
//
//  Created by Amg on 30/08/2019.
//  Copyright © 2019 Amg-Gauthier. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //MARK: - Vars
    let quoteViewModel = QuoteViewModel()
    
    //MARK: - @IBoutlets
    @IBOutlet weak var loadQuoteButton: UIButton!
    @IBOutlet weak var randomImageView: UIImageView!
    @IBOutlet weak var quoteTextView: UITextView!
    @IBOutlet weak var authorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpDisplay()
    }

    //MARK: - @IBAction
    @IBAction func getQuoteAndImageBtn_Touch_Up_Inside(_ sender: UIButton) {
        setUpDisplay()
    }
}

extension ViewController {
    //MARK: - Functions
    private func setUpDisplay() {
        quoteViewModel.getRandomImage { (image) in
            self.randomImageView.image = UIImage(data: image)
        }
        
        
        quoteViewModel.getQuoteToDisplay { (author, text) in
            self.authorLabel.text = author
            self.quoteTextView.text = text
        }
    }
}
