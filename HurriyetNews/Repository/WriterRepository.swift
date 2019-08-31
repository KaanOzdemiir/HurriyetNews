//
//  WriterRepository.swift
//  HurriyetNews
//
//  Created by Kaan Ozdemir on 1.09.2019.
//  Copyright © 2019 Kaan Ozdemir. All rights reserved.
//

import Foundation
import RxSwift

class WriterRepository {
    
    func getWriters() -> Observable<[ArticleResponse]> {
        
        return Observable.create({ observer -> Disposable in
            
            AlamofireService.getWriters(completion: { (response) in
                
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

