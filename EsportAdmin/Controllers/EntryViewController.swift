//
//  EntryViewController.swift
//  
//
//  Created by DEIK on 2019. 04. 28..
//

import UIKit

class EntryViewController: UITableViewController {
    var parentVC: ProfileViewController?
    var entries: [Entry]?
    var teams: [Teams]? = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getTeams()
    }
    
    func getTeams() {
        teams?.removeAll()
        let url = "\(Constants.BaseApiUrl.url)/teams/listAll"
        
        RestClient.shared.get(url: url, with: nil, isTokenNeeded: true, success: { (response) in
            for team in response {
                self.teams?.append(Teams(json: team.1))
            }
            self.tableView.reloadData()
        }) { (error) in
            NSLog("\(error)")
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (entries?.count)!
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 350
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Cells.entryCell, for: indexPath) as? EntryViewCell {
            let entry = entries?[indexPath.row]
            let name = entry?.name ?? "-"
            let info = entry?.info ?? "-"
            let date = entry?.date ?? "-"
            
            var teamName: String = ""
            
            for team in teams! {
                if team.id == entry?.teamId {
                    teamName = team.name!
                }
            }
            
            cell.bind(name: name, team: teamName, info: info, date: date)
            
            tableView.tableFooterView = UIView()
            return cell
        }
        return UITableViewCell()
    }
 


}
