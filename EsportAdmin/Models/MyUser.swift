//
//  MyUser.swift
//  EsportAdmin
//
//  Created by DEIK on 2019. 04. 10..
//  Copyright © 2019. Tamás Magyar. All rights reserved.
//

import Foundation
import SwiftyJSON

struct MyUser {
    var id: String?
    var firstName: String?
    var lastName: String?
    var username: String?
    var email: String?
    var profilePic: String?
    var birthday: String?
    var roles: [Roles]? = []
    var teams: [Teams]? = []
    var gameDetails: [GameDetails]? = []
    
    
    init() {}
    
    init(json: JSON) {
        self.id = json["id"].rawString()
        self.firstName = json["firstName"].rawString()
        self.lastName = json["lastName"].rawString()
        self.username = json["username"].rawString()
        self.email = json["email"].rawString()
        self.profilePic = json["profilePic"].rawString()
        self.birthday = json["birthday"].rawString()
       
        for roles in json["roles"] {
            let rolesModel = Roles(json: roles.1)
            self.roles?.append(rolesModel)
        }
        
        for teams in json["teams"] {
            let teamsModel = Teams(json: teams.1)
            self.teams?.append(teamsModel)
        }
        
        for gameDetails in json["gameDetails"] {
            let gameDetailsModel = GameDetails(json: gameDetails.1)
            self.gameDetails?.append(gameDetailsModel)
        }
    }
}
