//
//  AlamofireService.swift
//  HurriyetNews
//
//  Created by Kaan Ozdemir on 28.08.2019.
//  Copyright © 2019 Kaan Ozdemir. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class AlamofireService {
    private static let apiKey = "08df8a2b8afb4383b038c1942b357d5f"
    
    private static let host = "api.hurriyet.com.tr"
    
    static let defaultHeaderParams = [
        "accept": "application/json",
        "apikey": AlamofireService.apiKey
    ]
    
    static func getArticles(params: [String: AnyObject], completion: @escaping (DataResponse<[ArticleResponse]>) -> ()) {
        
        var urlComponents = URLComponents()
        urlComponents.host = host
        urlComponents.path = URLPath.articleGet
        urlComponents.scheme = "https"
        
        print("\n\(urlComponents.string!) istek atılıyor...")
        Alamofire.request(urlComponents.string!, method: .get, parameters: params, encoding: URLEncoding.default, headers: defaultHeaderParams).responseArray { (response: DataResponse<[ArticleResponse]>) in
            
            print(response.result.value)
            completion(response)
        }
            .responseJSON { response in
                print("JSON:\(response.result.value)")
                switch(response.result) {
                case .success(_):
                    if let data = response.result.value{
                        print(data)
                    }
                    
                case .failure(_):
                    
                    print("Error message:\(response.result.error)")
                    break
                    
                }
            }
        
    }
}
