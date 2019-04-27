//
//  Entry.swift
//  EsportAdmin
//
//  Created by DEIK on 2019. 04. 27..
//  Copyright © 2019. Tamás Magyar. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Entry {
    var broadcastLink: String?
    var date: String?
    var id: String?
    var info: String?
    var link: String?
    var location: String?
    var memberIds: [String]? = []
    var name: String?
    var teamId: String?
    
    init() {}
    
    init(json: JSON) {
        self.broadcastLink = json["broadcastLink"].rawString()
        self.date = json["date"].rawString()
        self.id = json["id"].rawString()
        self.info = json["info"].rawString()
        self.link = json["link"].rawString()
        self.location = json["location"].rawString()
        for membersId in json["memberIds"] {
            let memberId = membersId.1.rawString()
            self.memberIds?.append(memberId!)
        }
        self.name = json["name"].rawString()
        self.teamId = json["teamId"].rawString()
    }
}
