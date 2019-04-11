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
    var id: String?
    var name: String?
    var alterName: String?
    var middleLeaderID: String?
    
    
    init() {}
    
    init(json: JSON) {
        self.id = json["id"].stringValue
        self.name = json["name"].stringValue
        self.alterName = json["alterName"].stringValue
        self.middleLeaderID = json["middleLeaderID"].stringValue
        
    }
}
