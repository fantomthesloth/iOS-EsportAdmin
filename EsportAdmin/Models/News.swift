//
//  News.swift
//  EsportAdmin
//
//  Created by DEIK on 2019. 04. 24..
//  Copyright © 2019. Tamás Magyar. All rights reserved.
//

import Foundation
import SwiftyJSON

struct News {
    var authorId: String?
    var authorName: String?
    var authorPictureURL: String?
    var content: String?
    var created: String?
    var gameId: String?
    var id: String?
    var newsType: String?
    var pictureUrls: [String]?
    var teamId: String?
    var title: String?
    
    init() {}
    
    init(json: JSON) {
        self.authorId = json["authorId"].rawString()
        self.authorName = json["authorName"].rawString()
        self.authorPictureURL = json["authorPictureURL"].rawString()
        self.content = json["content"].rawString()
        self.created = json["created"].rawString()
        self.gameId = json["gameId"].rawString()
        self.id = json["id"].rawString()
        self.newsType = json["newsType"].rawString()
        
        for pictureUrls in json["pictureUrls"] {
            self.pictureUrls?.append(pictureUrls.1.rawString()!)
        }
        
        self.teamId = json["teamId"].rawString()
        self.title = json["title"].rawString()
    }
}
