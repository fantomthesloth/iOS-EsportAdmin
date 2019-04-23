//
//  Team.swift
//  EsportAdmin
//
//  Created by DEIK on 2019. 04. 10..
//  Copyright © 2019. Tamás Magyar. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Teams {
    var id: String?
    var gameId: String?
    var name: String?
    var membersId: [String]? = []
    var leaderId: String?
    
    init() {}
    
    init(json: JSON) {
        self.id = json["id"].rawString()
        self.gameId = json["gameId"].rawString()
        self.name = json["name"].rawString()
        for membersId in json["membersId"] {
            let memberId = membersId.1.rawString()
            self.membersId?.append(memberId!)
        }
        self.leaderId = json["leaderId"].rawString()
    }
}
