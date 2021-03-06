//
//  TeamsViewController.swift
//  EsportAdmin
//
//  Created by DEIK on 2019. 04. 17..
//  Copyright © 2019. Tamás Magyar. All rights reserved.
//

import UIKit

class TeamsViewController: UITableViewController {
    var parentVC: ProfileViewController?
    var teamMembers: [MyUser]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return (parentVC?.myUser?.teams?.count)!
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (parentVC?.myUser?.teams?[section].membersId?.count)!
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return parentVC?.myUser?.teams?[section].name
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Cells.teamsCell, for: indexPath) as? TeamsViewCell {
            
            let teamId = parentVC?.myUser?.teams?[indexPath.row].id
            
            for player in teamMembers! {
                for gameDetail in player.gameDetails! {
                    if gameDetail.teamId == teamId {
                        cell.bind(name: gameDetail.ign!, role: gameDetail.teamRole!)
                    }
                }
            }
            tableView.tableFooterView = UIView()
            return cell
        }
        return UITableViewCell()
    }
}
