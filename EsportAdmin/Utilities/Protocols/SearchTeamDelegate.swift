//
//  SearchTeamDelegate.swift
//  EsportAdmin
//
//  Created by DEIK on 2019. 04. 27..
//  Copyright © 2019. Tamás Magyar. All rights reserved.
//

import Foundation

protocol SearchTeamDelegate {
    func searchTeamDidSucces(response: Teams)
    func searchTeamDidFail(error: Error?)
}
