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
    @IBOutlet weak var myTeamsButton: UIButton!
    @IBOutlet weak var myEntriesButton: UIButton!
    
    var myUser: MyUser?
    var teamMembers: [MyUser]? = []
    var loadingScreen: LoadingScreen?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addLoadingScreen()
        initialSetup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        RestClient.loadUser(delegate: self)
    }
    
    func initialSetup() {
        userPicture.layer.cornerRadius = userPicture.frame.size.width / 2
        userPicture.clipsToBounds = true
        userPicture.layer.borderWidth = 3.5
        userPicture.layer.borderColor = UIColor.lightGray.cgColor
        myTeamsButton.layer.cornerRadius = 8.0
        myEntriesButton.layer.cornerRadius = 8.0
    }
    
    func addLoadingScreen() {
        loadingScreen = LoadingScreen(frame: self.view.frame)
        self.view.addSubview(loadingScreen!)
        self.view.bringSubviewToFront(loadingScreen!)
    }
    
    func removeLoadingScreen() {
        loadingScreen?.removeFromSuperview()
    }
    
    func setupContent() {
        let firstName = myUser?.firstName ?? ""
        let lastName = myUser?.lastName ?? ""
        let username = myUser?.username ?? ""
        let profilePic = myUser?.profilePic ?? ""
        var games: [String] = []
        
        for gameDetail in (myUser?.gameDetails)! {
            games.append((gameDetail.game?.name)!)
        }
        
        userPicture.sd_setImage(with: URL(string: profilePic))
        userNameLabel.text = "\(lastName) \(firstName)"
        userIgnLabel.text = "\(username)"
        userGameLabel.text = games.joined(separator: ",\n")
        
        getTeamMembers()
        getEntries()
        removeLoadingScreen()
    }
    
    func getTeamMembers() {
        for team in (myUser?.teams)! {
            for member in team.membersId! {
                RestClient.searchPlayer(id: member, delegate: self)
            }
        }
    }
    
    func getEntries() {
        
    }
    
    @IBAction func showTeams(_ sender: Any) {
        let vc: TeamsViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TeamsViewController") as! TeamsViewController
        vc.parentVC = self
        vc.teamMembers = teamMembers
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func showEntries(_ sender: Any) {
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

extension ProfileViewController: SearchProfileDelegate {
    func searchProfileDidSuccess(response: MyUser) {
        teamMembers?.append(response)
    }
    
    func searchProfileDidFail(error: Error?) {
        NSLog("⚠️ Getting profile failed")
    }
    
    
}
