//
//  ArticleViewModel.swift
//  HurriyetNews
//
//  Created by Kaan Ozdemir on 28.08.2019.
//  Copyright © 2019 Kaan Ozdemir. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class ArticleViewModel {
    
    let disposeBag = DisposeBag()
    
    let articleResponse = PublishSubject<[ArticleResponse]>()
    
    let articles = BehaviorRelay<[ArticleResponse]>(value: [])
    
    
    let articleRepository = ArticleRepository()
    
    func fetchArticles(params: [String: AnyObject]) {
        
        articleRepository.getArticles(params: params).subscribe(onNext: { (articleResponse) in
            self.articleResponse.onNext(articleResponse)
            
            self.articles.accept(articleResponse)
        }, onError: { (error) in
            self.articleResponse.onError(error)
        })
        .disposed(by: disposeBag)
    }
}
