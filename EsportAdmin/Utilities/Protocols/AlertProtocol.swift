//
//  AlertProtocol.swift
//  EsportAdmin
//
//  Created by DEIK on 2019. 04. 10..
//  Copyright © 2019. Tamás Magyar. All rights reserved.
//

import Foundation
import UIKit

protocol AlertProtocol {
    func showAlert(title: String, message: String, actionTitle: String, actionStyle: UIAlertAction.Style)
}
