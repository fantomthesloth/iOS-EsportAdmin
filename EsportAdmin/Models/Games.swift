//
//  Game.swift
//  EsportAdmin
//
//  Created by DEIK on 2019. 04. 10..
//  Copyright © 2019. Tamás Magyar. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Games {
    var id: String?
    var name: String?
    var alterName: String?
    var middleLeaderID: String?
    
    
    init() {}
    
    init(json: JSON) {
        self.id = json["id"].rawString()
        self.name = json["name"].rawString()
        self.alterName = json["alterName"].rawString()
        self.middleLeaderID = json["middleLeaderId"].rawString()
        
    }
}
