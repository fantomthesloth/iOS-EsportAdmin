//
//  ArticleModel.swift
//  SwiftyJSONTutorial
//
//  Created by DEIK on 2018. 12. 14..
//  Copyright © 2018. Tamás Magyar. All rights reserved.
//

import UIKit
import SwiftyJSON

struct NewsModel {
    var title: String = ""
    var description: String = ""
    var imageUrl: String = ""
    var url: String = ""
    
    init(json: JSON) {
        title = json["title"].stringValue
        description = json["description"].stringValue
        imageUrl = json["urlToImage"].stringValue
        url = json["url"].stringValue
    }
}
