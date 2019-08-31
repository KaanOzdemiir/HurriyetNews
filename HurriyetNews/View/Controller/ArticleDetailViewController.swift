//
//  ArticleDetailViewController.swift
//  HurriyetNews
//
//  Created by Kaan Ozdemir on 30.08.2019.
//  Copyright © 2019 Kaan Ozdemir. All rights reserved.
//

import UIKit
import Kingfisher
import Lottie

class ArticleDetailViewController: UIViewController {
    
    @IBOutlet weak var articleImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    let viewModel = ArticleDetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        subscribeArticleResponse()
    }
    
    func subscribeArticleResponse() {
        viewModel.articleResponse.subscribe(onNext: { (articleResponse) in

            self.spinner.stopAnimating()
            if let urlString = articleResponse.files?.first?.fileUrl, let url = URL(string: urlString), let id = articleResponse.id {
                let resource = ImageResource(downloadURL: url, cacheKey: id)
                self.articleImageView.kf.setImage(with: resource)
            }
            
            self.titleLabel.text = articleResponse.title
            self.contentLabel.text = articleResponse.text?.convertHtml().string
            
            let content = articleResponse.text?.convertHtml().string
            self.contentLabel.text = content
            
            let components = content?.components(separatedBy: .whitespacesAndNewlines)
            let words = components?.filter { !$0.isEmpty }
            
            self.durationLabel.text = words!.count.minute
            
        }, onError: { (error) in
            
            
        })
            .disposed(by: viewModel.disposeBag)
    }
}
