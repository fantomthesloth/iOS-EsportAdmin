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

protocol Networking {
    static func login(with username: String, password: String, with delegate: LoginDelegate)
}

class RestClient: Networking {
    static let shared = RestClient()
    private init() {}
    
    var token: Token?
    
    private var headers = [
        "Authorization": "Token \(UserDefaults.standard.value(forKey: Constants.UserDefaultsKeys.token) ?? "")",
        "Content-Type": "application/json"
    ]
    
    static func updateToken(to token: String) {
        self.shared.headers["Authorization"] = "Token \(token)"
    }
    
    static func login(with username: String, password: String, with delegate: LoginDelegate) {
        let url = "\(Constants.BaseApiUrl.url)/login"
        let params = ["password": password, "usernameOrEmail": username]
        
        shared.post(url: url, with: params, isTokenNeeded: false, success: { response in
            let token = Token(json: response)
            delegate.loginDidSuccess(response: token)
        },fail: { error in
            delegate.loginDidFail(error: error)
        })
    }
    
    //MARK: Private functions
    private func get(url: String, with data: [String: Any]?, isTokenNeeded: Bool, success: ((JSON) -> Void)?, fail: ((Error) -> Void)?) {
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
                print("Request: \(String(describing: response.request))")
                print("Response: \(String(describing: response.response))")
                print("Result: \(response.result)")
                
                if let error = response.error {
                    NSLog("⚠️ \(error)")
                    if let fail = fail {
                        fail(error)
                    }
                    return
                }
                
                if let json = response.result.value {
                    print("✨ JSON: \(json)")
                    if let success = success {
                        success(JSON(json))
                    }
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
            .validate(statusCode: 200..<300)
            .responseJSON { response in
                print("Request: \(String(describing: response.request))")
                print("Response: \(String(describing: response.response))")
                print("Result: \(response.result)")
                
                if let error = response.error {
                    NSLog("⚠️ \(error)")
                    if let fail = fail {
                        fail(error)
                    }
                    return
                }
                
                if let json = response.result.value {
                    print("✨ JSON: \(json)") // serialized json response
                    if let success = success {
                        success(JSON(json))
                    }
                }
        }
    }
}
