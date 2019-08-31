//
//  NewsTableViewCell.swift
//  HurriyetNews
//
//  Created by Kaan Ozdemir on 29.08.2019.
//  Copyright © 2019 Kaan Ozdemir. All rights reserved.
//

import UIKit
import Shimmer
import Kingfisher

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var shimmerView: FBShimmeringView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var firstTag: UILabel!
    @IBOutlet weak var secondTag: UILabel!
    @IBOutlet weak var thirdTag: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
    }
    
    func setWith(article: ArticleResponse) {
        spinner.startAnimating()
        titleLabel.text = article.title
        
        firstTag.text = article.tags?[0].capitalized
        secondTag.text = article.tags?[1].capitalized
        thirdTag.text = article.tags?[2].capitalized
        
        dayLabel.text = article.createdDate
        
        
        if let urlString = article.files?.first?.fileUrl, let url = URL(string: urlString), let id = article.id {
            
            let processor = DownsamplingImageProcessor(size: newsImageView.frame.size)
                >> RoundCornerImageProcessor(cornerRadius: 5)
            newsImageView.kf.indicatorType = .activity
            newsImageView.kf.setImage(
                with: url,
                options: [
                    .processor(processor),
                    .scaleFactor(UIScreen.main.scale),
                    .transition(.fade(1)),
                    .cacheOriginalImage
                ])
            {
                result in
                
                self.spinner.stopAnimating()
                switch result {
                case .success(let value):
                    print("Task done for: \(value.source.url?.absoluteString ?? "")")
                case .failure(let error):
                    print("Job failed: \(error.localizedDescription)")
                }
            }
            
            let resource = ImageResource(downloadURL: url, cacheKey: id)
            newsImageView.kf.setImage(with: resource)
        }
    }
}
