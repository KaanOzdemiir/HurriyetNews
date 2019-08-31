//
//  ArticleDetailViewModel.swift
//  HurriyetNews
//
//  Created by Kaan Ozdemir on 31.08.2019.
//  Copyright © 2019 Kaan Ozdemir. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class ArticleDetailViewModel {
    
    let disposeBag = DisposeBag()
    
    let articleResponse = PublishSubject<ArticleResponse>()
    
    let articleRepository = ArticleRepository()
    
    func fetchArticleBy(id: String) {
        
        articleRepository.getArticleBy(id: id)
            .subscribe(onNext: { (articleResponse) in
            self.articleResponse.onNext(articleResponse)
            
        }, onError: { (error) in
            self.articleResponse.onError(error)
        })
            .disposed(by: disposeBag)
    }
}

