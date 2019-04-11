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
    var id: String?
    var gameId: String?
    var teamId: String?
    var ign: String?
    var teamRole: String?
    
    init() {}
    
    init(json: JSON) {
        self.id = json["id"].stringValue
        self.gameId = json["gameId"].stringValue
        self.teamId = json["teamId"].stringValue
        self.ign = json["ign"].stringValue
        self.teamRole = json["teamRole"].stringValue
    }
}
