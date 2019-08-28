//
//  AlamofireService.swift
//  HurriyetNews
//
//  Created by Kaan Ozdemir on 28.08.2019.
//  Copyright © 2019 Kaan Ozdemir. All rights reserved.
//

import Foundation
import Alamofire

class AlamofireService {
    private static let apiKey = "08df8a2b8afb4383b038c1942b357d5f"
    
    private static let host = "api.hurriyet.com.tr"
    
    static let defaultHeaderParams = [
        "accept": "application/json",
        "apikey": AlamofireService.host
    ]
    
    static func getArticles() -> DataRequest {
        
        var urlComponents = URLComponents()
        urlComponents.host = host
        urlComponents.path = URLPath.articleGet
        urlComponents.scheme = "https"
        
        print("\n\(urlComponents.string) istek atılıyor...")
        return Alamofire.request(urlComponents.string!, method: .get, encoding: URLEncoding.default, headers: defaultHeaderParams)
    }
}
