//
//  GameDetail.swift
//  EsportAdmin
//
//  Created by DEIK on 2019. 04. 10..
//  Copyright © 2019. Tamás Magyar. All rights reserved.
//

import Foundation
import SwiftyJSON

struct GameDetail {
    var gameId: String?
    var id: String?
    var ign: String?
    var teamId: String?
    var teamRole: String?
    
    init() {}
    
    init(json: JSON) {
        self.gameId = json["gameId"].stringValue
        self.id = json["id"].stringValue
        self.ign = json["ign"].stringValue
        self.teamId = json["teamId"].stringValue
        self.teamRole = json["teamRole"].stringValue
    }
}
