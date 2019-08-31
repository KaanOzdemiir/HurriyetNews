//
//  Extentions.swift
//  HurriyetNews
//
//  Created by Kaan Ozdemir on 31.08.2019.
//  Copyright © 2019 Kaan Ozdemir. All rights reserved.
//

import UIKit

extension String {
    func convertHtml() -> NSAttributedString{
        let htmlCSSString = "<style>" +
            "html *" +
            "{" +
            "font-size: 10pt !important;" +
            "font-family: Helvetica, Helvetica !important;" +
        "}</style>"
        
        guard var data = data(using: .utf8) else { return NSAttributedString() }
        do{
            
            
            data.append(Data(htmlCSSString.utf8))
            
            
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, NSAttributedString.DocumentReadingOptionKey.characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
        }catch{
            return NSAttributedString()
        }
    }
}

extension Int {
    var minute: String {
        
        let min = Int((Double(self) / 220.0).rounded())
        if min < 1 {
            return "1 Dk'dan az"
        }
        return "\(min) Dk"
        
    }
}
