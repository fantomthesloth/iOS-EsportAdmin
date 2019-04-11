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
    var birthday: String?
    var email: String?
    var firstName: String?
    var gameDetails: [GameDetail]?
    var games: [Game]?
    var id: String?
    var lastName: String?
    var profilePic: String?
    var roles: [Role]?
    var teams: [Team]?
    var username: String?
    
    init() {}
    
    init(json: JSON) {
        self.birthday = json["birthday"].stringValue
        self.email = json["email"].stringValue
        self.firstName = json["firstName"].stringValue
        self.id = json["id"].stringValue
        self.lastName = json["lastName"].stringValue
        self.profilePic = json["profilePic"].stringValue
        self.username = json["username"].stringValue
        
        for gameDetail in json["gameDetails"] {
            let gameDetail = GameDetail(json: gameDetail.1)
            self.gameDetails?.append(gameDetail)
        }
        
        for games in json["games"] {
            let games = Game(json: games.1)
            self.games?.append(games)
        }
        
        for roles in json["roles"] {
            let roles = Role(json: roles.1)
            self.roles?.append(roles)
        }
        
        for teams in json["gameDetails"] {
            let teams = Team(json: teams.1)
            self.teams?.append(teams)
        }
    }
}
