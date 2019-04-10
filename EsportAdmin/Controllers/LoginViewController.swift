//
//  MainViewController.swift
//  SwiftyJSONTutorial
//
//  Created by DEIK on 2018. 12. 14..
//  Copyright © 2018. Tamás Magyar. All rights reserved.
//

import UIKit
import SnapKit

class LoginViewController: UIViewController {
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordTextField.isSecureTextEntry = true
        
        usernameTextField.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(200)
            make.width.equalTo(300)
        }

        passwordTextField.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(usernameTextField.snp.bottom).offset(30)
            make.width.equalTo(300)
        }
    }
    
    @IBAction func loginFcn(_ sender: Any) {
        RestClient.login(with: usernameTextField.text ?? "", password: passwordTextField.text ?? "", with: self)
    }

}

extension LoginViewController: LoginDelegate {
    func loginDidFail(error: Error?) {
        showAlert(title: "Hibás bejelentkezés", message: "Rossz felhasználónév vagy jelszó", actionTitle: "Cancel", actionStyle: .cancel)
    }
    
    func loginDidSuccess(response: Token) {
        NSLog("😊 Login Successful")
        Constants.kAppDelegate.token = response
        performSegue(withIdentifier: Constants.Segues.loginToNews, sender: self)
    }
}
