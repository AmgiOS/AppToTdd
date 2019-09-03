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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    //MARK: - @IBAction
    @IBAction func getQuoteAndImageBtn_Touch_Up_Inside(_ sender: UIButton) {
    }
}

