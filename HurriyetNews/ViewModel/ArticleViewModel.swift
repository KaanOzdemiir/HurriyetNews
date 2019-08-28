//
//  ArticleViewModel.swift
//  HurriyetNews
//
//  Created by Kaan Ozdemir on 28.08.2019.
//  Copyright © 2019 Kaan Ozdemir. All rights reserved.
//

import Foundation
import RxSwift

class ArticleViewModel {
    
    let articleResponse = PublishSubject<ArticleResponse>()
    
    let articleRepository = ArticleRepository()
    
    func getArticles() {
        
        articleRepository.getArticleRequest { (result: Result<ArticleResponse, Error>) in
            
            switch result {
            case .success(let articleResponse):
                print(articleResponse)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}