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
    var gameId: String?
    var id: String?
    var leaderId: String?
    var membersId: [String]?
    var name: String?
    
    init() {}
    
    init(json: JSON) {
        self.gameId = json["gameId"].stringValue
        self.id = json["id"].stringValue
        self.leaderId = json["leaderId"].stringValue
        self.name = json["name"].stringValue
        
        for membersId in json["membersId"] {
            self.membersId?.append(membersId.0)
        }
    }
}
