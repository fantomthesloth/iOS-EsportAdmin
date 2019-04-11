//
//  Role.swift
//  EsportAdmin
//
//  Created by DEIK on 2019. 04. 10..
//  Copyright © 2019. Tamás Magyar. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Role {
    var id: String?
    var roleName: String?
    
    init() {}
    
    init(json: JSON) {
        self.id = json["id"].stringValue
        self.roleName = json["roleName"].stringValue
    }
}
