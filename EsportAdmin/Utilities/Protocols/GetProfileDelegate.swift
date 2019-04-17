//
//  GetProfileDelegate.swift
//  EsportAdmin
//
//  Created by DEIK on 2019. 04. 17..
//  Copyright © 2019. Tamás Magyar. All rights reserved.
//

import Foundation

protocol GetProfileDelegate {
    func getProfileDidSuccess(response: MyUser)
    func getProfileDidFail(error: Error?)
}
