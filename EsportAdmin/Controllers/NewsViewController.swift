//
//  TableViewController.swift
//  SwiftyJSONTutorial
//
//  Created by DEIK on 2018. 12. 14..
//  Copyright © 2018. Tamás Magyar. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire


class NewsViewController: UITableViewController {
    @IBOutlet var tabeView: UITableView!
    
    var articles: [NewsModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getJson()
    }
    
    func getJson() {
        guard let url = URL(string: Constants.Json.url) else {return}
        
        Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil)
            .validate().responseJSON { (response) in
                if let error = response.error {
                    print("\(error)")
                }
                
                if let json = response.result.value {
                    print("JSON: \(json)")
                    let jsonData = JSON(json)
                    
                    for article in jsonData["articles"] {
                        self.articles.append(NewsModel(json: article.1))
                    }
                }
                self.tableView.reloadData()
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 345
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: Constants.NewsTable.cellIdentifier, for: indexPath) as? NewsViewCell {
            let article = articles[indexPath.row]
            
            cell.bind(title: article.title, description: article.description, imageUrl: article.imageUrl)
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: Constants.Segues.newsToWeb, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constants.Segues.newsToWeb {
            if let webvc = segue.destination as? WebViewController {
                if let indexPath = tabeView.indexPathForSelectedRow {
                    webvc.url = articles[indexPath.row].url
                    tabeView.deselectRow(at: indexPath, animated: true)
                }
            }
        }
    }
    
    
}
