//
//  ProfileController.swift
//  EsportAdmin
//
//  Created by DEIK on 2019. 01. 01..
//  Copyright © 2019. Tamás Magyar. All rights reserved.
//

import UIKit
import SDWebImage

class ProfileViewController: UIViewController {
    @IBOutlet weak var userPicture: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userIgnLabel: UILabel!
    @IBOutlet weak var userGameLabel: UILabel!
    
    var myUser: MyUser?
    var teamMembers: [MyUser]? = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userPicture.layer.cornerRadius = userPicture.frame.size.width / 2
        userPicture.clipsToBounds = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        RestClient.loadUser(delegate: self)
    }
    
    func setupContent() {
        let firstName = myUser?.firstName ?? ""
        let lastName = myUser?.lastName ?? ""
        let ign = myUser?.gameDetails?[0].ign ?? ""
        let profilePic = myUser?.profilePic ?? ""
        var games: [String] = []
        
        for game in (myUser?.games)!  {
            games.append(game.alterName!)
        }
        
        userPicture.sd_setImage(with: URL(string: profilePic))
        userNameLabel.text = "\(lastName) \(firstName)"
        userIgnLabel.text = "\(ign)"
        userGameLabel.text = games.joined(separator: ", ")
        
        for team in (myUser?.teams)! {
            for member in team.membersId! {
                RestClient.getUser(id: member, delegate: self)
            }
        }
        
    }
    
    
    @IBAction func showTeams(_ sender: Any) {
        let vc: TeamsViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TeamsViewController") as! TeamsViewController
        vc.parentVC = self
        vc.teamMembers = teamMembers
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension ProfileViewController: LoadProfileDelegate {
    func loadProfileDidSuccess(response: MyUser) {
        self.myUser = response
        NSLog("😊 Loading profile successful")
        setupContent()
    }
    
    func loadProfileDidFail(error: Error?) {
        NSLog("⚠️ Loading profile failed")
    }
}

extension ProfileViewController: GetProfileDelegate {
    func getProfileDidSuccess(response: MyUser) {
        teamMembers?.append(response)
    }
    
    func getProfileDidFail(error: Error?) {
        NSLog("⚠️ Getting profile failed")
    }
    
    
}
