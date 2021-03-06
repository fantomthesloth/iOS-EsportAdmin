//
//  Constants.swift
//  SwiftyJSONTutorial
//
//  Created by DEIK on 2018. 12. 17..
//  Copyright © 2018. Tamás Magyar. All rights reserved.
//

import Foundation
import UIKit

struct Constants {
    static let kAppDelegate = UIApplication.shared.delegate as! AppDelegate
    
    struct BaseApiUrl {
        static let url = "https://deac-hackers-rest.herokuapp.com/api"
    }
    
    struct Cells {
        static let newsCell = "NewsCell"
        static let teamsCell = "TeamsCell"
        static let entryCell = "EntryViewCell"
    }
    
    struct UserDefaultsKeys {
        static let token = "token"
        static let userId = "userId"
    }
    
    struct Segues {
        static let loginToNews = "LoginToNews"
        static let newsToAddArticle = "NewsToAddArticle"
        static let segueToTeams = "SegueToTeams"
    }
}
