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
    var roles: [Role]?
    var teams: [Team]?
    var games: [Game]?
    var gameDetails: [GameDetail]?
    
    
    init() {}
    
    init(json: JSON) {
        self.id = json["id"].stringValue
        self.firstName = json["firstName"].stringValue
        self.lastName = json["lastName"].stringValue
        self.username = json["username"].stringValue
        self.email = json["email"].stringValue
        self.profilePic = json["profilePic"].stringValue
        self.birthday = json["birthday"].stringValue
       
        for roles in json["roles"] {
            let roles = Role(json: roles.1)
            self.roles?.append(roles)
        }
        
        for teams in json["gameDetails"] {
            let teams = Team(json: teams.1)
            self.teams?.append(teams)
        }
        
        for games in json["games"] {
            let games = Game(json: games.1)
            self.games?.append(games)
        }
        
        for gameDetail in json["gameDetails"] {
            let gameDetail = GameDetail(json: gameDetail.1)
            self.gameDetails?.append(gameDetail)
        }
    }
}
