//
//  ArticleDetailViewController.swift
//  HurriyetNews
//
//  Created by Kaan Ozdemir on 30.08.2019.
//  Copyright © 2019 Kaan Ozdemir. All rights reserved.
//

import UIKit
import Kingfisher

class ArticleDetailViewController: UIViewController {
    
    @IBOutlet weak var articleImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    
    let viewModel = ArticleDetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.articleResponse.subscribe(onNext: { (articleResponse) in
            
            
            if let urlString = articleResponse.files?.first?.fileUrl, let url = URL(string: urlString), let id = articleResponse.id {
                let resource = ImageResource(downloadURL: url, cacheKey: id)
                self.articleImageView.kf.setImage(with: resource)
            }
            
            self.titleLabel.text = articleResponse.title
            self.contentLabel.text = articleResponse.text?.convertHtml().string
            

        }, onError: { (error) in
            
            
        })
        .disposed(by: viewModel.disposeBag)
        
    }
}
