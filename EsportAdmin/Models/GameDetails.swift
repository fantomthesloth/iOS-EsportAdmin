//
//  GameDetail.swift
//  EsportAdmin
//
//  Created by DEIK on 2019. 04. 10..
//  Copyright © 2019. Tamás Magyar. All rights reserved.
//

import Foundation
import SwiftyJSON

struct GameDetails {
    var id: String?
    var gameId: String?
    var teamId: String?
    var ign: String?
    var teamRole: String?
    
    init() {}
    
    init(json: JSON) {
        self.id = json["id"].rawString()
        self.gameId = json["gameId"].rawString()
        self.teamId = json["teamId"].rawString()
        self.ign = json["ign"].rawString()
        self.teamRole = json["teamRole"].rawString()
    }
}
