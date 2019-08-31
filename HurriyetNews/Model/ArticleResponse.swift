//
//  ArticleResponse.swift
//  HurriyetNews
//
//  Created by Kaan Ozdemir on 28.08.2019.
//  Copyright © 2019 Kaan Ozdemir. All rights reserved.
//

import Foundation
import ObjectMapper

class ArticleResponse: Mappable {
    
    var id: String?
    var contentType: String?
    var createdDate, description: String?
    var editor: String?
    var files: [FileData]?
    var modifiedDate, path, startDate: String?
    var relatedNews: [String]?
    var tags: [String]?
    var text, title: String?
    var url: String?
    var writers: [String]?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        id <- map["Id"]
        contentType <- map["ContentType"]
        createdDate <- map["CreatedDate"]
        description <- map["Description"]
        
        files <- map["Files"]
        modifiedDate <- map["ModifiedDate"]
        path <- map["Path"]
        startDate <- map["StartDate"]
        
        tags <- map["Tags"]
        title <- map["Title"]
        url <- map["Url"]
        editor <- map["Editor"]
        
        relatedNews <- map["RelatedNews"]
        text <- map["Text"]
        writers <- map["Writers"]
    }
    
    init(id: String? = nil, contentType: String? = nil, createdDate: String? = nil, articleResponseDescription: String? = nil, files: [FileData]? = nil, modifiedDate: String? = nil, path: String? = nil, startDate: String? = nil, tags: [String]? = nil, title: String? = nil, url: String? = nil, editor: String? = nil, relatedNews: [String]? = nil, text: String? = nil, writers: [String]? = nil) {
        self.id = id
        self.contentType = contentType
        self.createdDate = createdDate
        self.description = articleResponseDescription
        self.files = files
        self.modifiedDate = modifiedDate
        self.path = path
        self.startDate = startDate
        self.tags = tags
        self.title = title
        self.url = url
        self.editor = editor
        self.relatedNews = relatedNews
        self.text = text
        self.writers = writers
    }
}
// MARK: - File
class FileData: Mappable {
    var fileUrl: String?
    var metadata: MetaData?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        fileUrl <- map["FileUrl"]
        metadata <- map["Metadata"]
    }
    
    init(fileUrl: String? = nil, metadata: MetaData? = nil) {
        self.fileUrl = fileUrl
        self.metadata = metadata
    }
}

// MARK: - Metadata
class MetaData: Mappable {
    var title, description: String?
    
    init(title: String? = nil, metadataDescription: String? = nil) {
        self.title = title
        self.description = metadataDescription
    }
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        title <- map["Title"]
        description <- map["Description"]
    }
}
