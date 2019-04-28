//
//  LoginDelegate.swift
//  EsportAdmin
//
//  Created by DEIK on 2019. 04. 10..
//  Copyright © 2019. Tamás Magyar. All rights reserved.
//

import Foundation

protocol LoginDelegate {
    func loginDidSuccess(response: Token)
    func loginDidFail(error: Error?)
}
