//
//  Alert.swift
//  SwiftyJSONTutorial
//
//  Created by DEIK on 2018. 12. 17..
//  Copyright © 2018. Tamás Magyar. All rights reserved.
//

import UIKit

protocol AlertProtocol {
    func showAlert(title: String, message: String, actionTitle: String, actionStyle: UIAlertAction.Style)
}

extension UIViewController: AlertProtocol {
    func showAlert(title: String, message: String, actionTitle: String, actionStyle: UIAlertAction.Style) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: actionTitle, style: actionStyle, handler: nil))
        self.present(alertController, animated: true)
    }
}
