//
//  ProfileController.swift
//  EsportAdmin
//
//  Created by DEIK on 2019. 01. 01..
//  Copyright © 2019. Tamás Magyar. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    @IBOutlet weak var userPicture: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userPicture.layer.cornerRadius = userPicture.frame.size.width / 2
        userPicture.clipsToBounds = true
        // Do any additional setup after loading the view.
    }

}

extension ProfileViewController: LoadProfileDelegate {
    func loadProfileDidSuccess(response: MyUser) {
        NSLog("😊 Loading profile successful")
    }
    
    func loadProfileDidFail(error: Error?) {
        NSLog("⚠️ Loading profile failed")
    }
    
    
}
