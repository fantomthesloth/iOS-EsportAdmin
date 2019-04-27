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
    var game: Games?
    var teamId: String?
    var ign: String?
    var teamRole: String?
    
    init() {}
    
    init(json: JSON) {
        self.game = Games(json: json["game"])
        self.teamId = json["teamId"].rawString()
        self.ign = json["ign"].rawString()
        self.teamRole = json["teamRole"].rawString()
    }
}
