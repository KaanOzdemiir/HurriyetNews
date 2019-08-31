//
//  ArticleRepository.swift
//  HurriyetNews
//
//  Created by Kaan Ozdemir on 28.08.2019.
//  Copyright © 2019 Kaan Ozdemir. All rights reserved.
//

import Foundation
import RxSwift

class ArticleRepository {
    
    func getArticles(params: [String: AnyObject]) -> Observable<[ArticleResponse]> {
        
        return Observable.create({ observer -> Disposable in
            
            AlamofireService.getArticles(params: params, completion: { (response) in
                
                if let error = response.error {
                    observer.onError(error)
                    return
                }
                
                observer.onNext(response.result.value!)
                observer.onCompleted()
            })
            return Disposables.create()
        })
    }
    
    func getArticleBy(id: String) -> Observable<ArticleResponse> {
        
        return Observable.create({ observer -> Disposable in
            
            AlamofireService.getArticleBy(id: id, completion: { (response) in
                
                if let error = response.error {
                    observer.onError(error)
                    return
                }
                
                observer.onNext(response.result.value!)
                observer.onCompleted()
            })
            return Disposables.create()
        })
    }
}
