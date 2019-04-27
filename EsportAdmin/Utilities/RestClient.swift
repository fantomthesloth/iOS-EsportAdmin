//
//  RestClient.swift
//  EsportAdmin
//
//  Created by DEIK on 2019. 04. 10..
//  Copyright © 2019. Tamás Magyar. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

protocol RestFunctions {
    static func loadUser(delegate: LoadProfileDelegate)
    static func login(username: String, password: String, delegate: LoginDelegate)
    static func searchPlayer(id: String, delegate: SearchProfileDelegate)
    static func postArticle(authorId: String, authorName: String, authorPicUrl: String, title: String, content: String, created: String, delegate: PostArticleDelegate)
}

class RestClient: RestFunctions {
    static let shared = RestClient()
    private init() {}
    
    var token: Token?
    
    private var headers = [
        "Authorization": "Bearer \(UserDefaults.standard.value(forKey: Constants.UserDefaultsKeys.token) ?? "")",
        "Content-Type": "application/json"
    ]
    
    static func updateToken(to token: String) {
        self.shared.headers["Authorization"] = "Bearer \(token)"
    }
    
    //Mark: Rest Functions
    static func login(username: String, password: String, delegate: LoginDelegate) {
        let url = "\(Constants.BaseApiUrl.url)/login"
        let params = [
            "password": password,
            "usernameOrEmail": username
        ]
        
        shared.post(url: url, with: params, isTokenNeeded: false, success: { response in
            let token = Token(json: response)
            delegate.loginDidSuccess(response: token)
        },fail: { error in
            delegate.loginDidFail(error: error)
        })
    }
    
    static func postArticle(authorId: String, authorName: String, authorPicUrl: String, title: String, content: String, created: String, delegate: PostArticleDelegate) {
        let url = "\(Constants.BaseApiUrl.url)/news/add"
        let params = [
            "id": nil,
            "authorId": authorId,
            "authorName": authorName,
            "authorPictureUrl": authorPicUrl,
            "newsType": "GLOBAL",
            "gameId": nil,
            "teamId": nil,
            "created": "2019-04-22T13:57:42.201+0000",
            "title": title,
            "content": content,
            "pictureUrls": []
            ] as [String : Any?]
        
        shared.post(url: url, with: params, isTokenNeeded: true, success: { (response) in
            let news = News(json: response)
            delegate.postArticleDidSucces(response: news)
        }) { (error) in
            delegate.postArticleDidFail(error: error)
        }
    }
    
    static func loadUser(delegate: LoadProfileDelegate) {
        let url = "\(Constants.BaseApiUrl.url)/players/me"
        
        shared.get(url: url, with: nil, isTokenNeeded: true, success: { (response) in
            let myUser = MyUser(json: response)
            delegate.loadProfileDidSuccess(response: myUser)
        }) { (error) in
            delegate.loadProfileDidFail(error: error)
        }
    }
    
    static func searchPlayer(id: String, delegate: SearchProfileDelegate) {
        let url = "\(Constants.BaseApiUrl.url)/players/\(id)"
        
        shared.get(url: url, with: nil, isTokenNeeded: true, success: { (response) in
            let user = MyUser(json: response)
            delegate.searchProfileDidSuccess(response: user)
        }) { (error) in
            delegate.searchProfileDidFail(error: error)
        }
    }
    
    static func searchTeam(teamName: String, delegate: SearchTeamDelegate) {
        let url = "\(Constants.BaseApiUrl.url)/search/\(teamName)"
        
        shared.get(url: url, with: nil, isTokenNeeded: true, success: { (response) in
            let team = Teams(json: response)
            delegate.searchTeamDidSucces(response: team)
        }) { (error) in
            delegate.searchTeamDidFail(error: error)
        }
    }
    
    static func searchPlayerByUsername(username: String, delegate: SearchProfileDelegate) {
        let url = "\(Constants.BaseApiUrl.url)/search/\(username)"
        
        shared.get(url: url, with: nil, isTokenNeeded: true, success: { (response) in
            let user = MyUser(json: response)
            delegate.searchProfileDidSuccess(response: user)
        }) { (error) in
            delegate.searchProfileDidFail(error: error)
        }
    }
    
    func get(url: String, with data: [String: Any]?, isTokenNeeded: Bool, success: ((JSON) -> Void)?, fail: ((Error) -> Void)?) {
        let head: [String: String]
        if isTokenNeeded {
            head = headers
        } else {
            head = ["Content-Type": "application/json"]
        }
        Alamofire.request(url,
                          method: .get,
                          parameters: data,
                          encoding: JSONEncoding.default,
                          headers: head)
            .validate(statusCode: 200..<300)
            .responseJSON { response in
                print("♻️ Request result: \(response.result)")
                print("♻️ Request response: \(response)")
                
                if let json = response.result.value {
                    NSLog("✨ JSON: \(json)")
                    if let success = success {
                        success(JSON(json))
                    }
                }
                
                if let error = response.error {
                    NSLog("⚠️ \(error)")
                    if let fail = fail {
                        fail(error)
                    }
                    return
                }
        }
    }
    
    private func post(url: String, with data: [String: Any]?, isTokenNeeded: Bool, success: ((JSON) -> Void)?, fail: ((Error) -> Void)?) {
        let head: [String: String]
        if isTokenNeeded {
            head = headers
        } else {
            head = ["Content-Type": "application/json"]
        }
        Alamofire.request(url,
                          method: .post,
                          parameters: data,
                          encoding: JSONEncoding.default,
                          headers: head)
            .validate(statusCode: 200..<500)
            .responseJSON { response in
                print("♻️ Request result: \(response.result)")
                print("♻️ Request response: \(response)")
                
                if let json = response.result.value {
                    NSLog("✨ JSON: \(json)")
                    if let success = success {
                        success(JSON(json))
                    }
                }
                
                if let error = response.error {
                    NSLog("⚠️ \(error)")
                    if let fail = fail {
                        fail(error)
                    }
                    return
                }
        }
    }
}
