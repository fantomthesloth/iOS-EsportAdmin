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
    
    struct Json {
        static let url = "https://newsapi.org/v2/everything?q=bitcoin&from=2019-03-07&sortBy=publishedAt&apiKey=bb0132b615b34022b5e54cde1eafc300"
    }
    
    struct BaseApiUrl {
        static let url = "https://deac-hackers-rest.herokuapp.com/api"
    }
    struct NewsTable {
        static let cellIdentifier = "myCell"
    }
    
    struct UserDefaultsKeys {
        static let token = "token"
    }
    
    struct Segues {
        static let startToLogin = "startToLogin"
        static let loginToNews = "loginToNews"
        static let newsToWeb = "newsToWeb"
    }
}
