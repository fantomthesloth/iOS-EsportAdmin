//
//  Token.swift
//  EsportAdmin
//
//  Created by DEIK on 2019. 04. 10..
//  Copyright © 2019. Tamás Magyar. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Token {
    var token: String?
    
    init() {}
    
    init(json: JSON) {
        self.token = json["token"].stringValue
    }
}
