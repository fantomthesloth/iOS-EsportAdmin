//
//  Game.swift
//  EsportAdmin
//
//  Created by DEIK on 2019. 04. 10..
//  Copyright © 2019. Tamás Magyar. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Game {
    var alterName: String?
    var id: String?
    var middleLeaderID: String?
    var name: String?
    
    init() {}
    
    init(json: JSON) {
        self.alterName = json["alterName"].stringValue
        self.id = json["id"].stringValue
        self.middleLeaderID = json["middleLeaderID"].stringValue
        self.name = json["name"].stringValue
    }
}
