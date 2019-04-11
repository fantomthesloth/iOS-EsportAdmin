//
//  Team.swift
//  EsportAdmin
//
//  Created by DEIK on 2019. 04. 10..
//  Copyright © 2019. Tamás Magyar. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Team {
    var id: String?
    var gameId: String?
    var name: String?
    var membersId: [String]?
    var leaderId: String?
    
    init() {}
    
    init(json: JSON) {
        self.id = json["id"].stringValue
        self.gameId = json["gameId"].stringValue
        self.name = json["name"].stringValue
        for membersId in json["membersId"] {
            self.membersId?.append(membersId.0)
        }
        self.leaderId = json["leaderId"].stringValue
    }
}
