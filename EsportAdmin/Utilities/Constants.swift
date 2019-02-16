//
//  Constants.swift
//  SwiftyJSONTutorial
//
//  Created by DEIK on 2018. 12. 17..
//  Copyright © 2018. Tamás Magyar. All rights reserved.
//

import Foundation

struct Constants {
    struct Json {
        static let url = "https://newsapi.org/v2/everything?q=apple&from=2018-12-13&to=2018-12-13&sortBy=popularity&apiKey=bb0132b615b34022b5e54cde1eafc300"
    }
    
    struct NewsTable {
        static let cellIdentifier = "myCell"
    }
    
    struct Segues {
        static let startToLogin = "startToLogin"
        static let startToSignup = "startToSignup"
        static let startToNews = "startToNews"
        static let loginToNews = "loginToNews"
        static let signupToNews = "signupToNews"
        static let newsToWeb = "newsToWeb"
    }
}
