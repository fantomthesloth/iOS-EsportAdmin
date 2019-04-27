//
//  GetEntriesDelegate.swift
//  EsportAdmin
//
//  Created by DEIK on 2019. 04. 28..
//  Copyright © 2019. Tamás Magyar. All rights reserved.
//

import Foundation

protocol GetEntriesDelegate {
    func getEntriesDidSucces(response: Entry)
    func getEntriesDidFail(error: Error?)
}
