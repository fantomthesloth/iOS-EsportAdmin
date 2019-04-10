//
//  LoadProfileDelegate.swift
//  EsportAdmin
//
//  Created by DEIK on 2019. 04. 10..
//  Copyright © 2019. Tamás Magyar. All rights reserved.
//

import Foundation

protocol LoadProfileDelegate {
    func loadProfileDidSuccess(response: MyUser)
    func loadProfileDidFail(error: Error?)
}
