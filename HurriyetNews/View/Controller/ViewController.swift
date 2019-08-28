//
//  ViewController.swift
//  HurriyetNews
//
//  Created by Kaan Ozdemir on 28.08.2019.
//  Copyright © 2019 Kaan Ozdemir. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let viewModel = ArticleViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        viewModel.getArticles()
    }


}

