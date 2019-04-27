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
    var articles: [News] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getNews()
        
    }
    
    func getNews() {
        let url = "\(Constants.BaseApiUrl.url)/news/listMyNews"
        
        RestClient.shared.get(url: url, with: nil, isTokenNeeded: true, success: { (response) in
            for news in response {
                self.articles.append(News(json: news.1))
            }
            self.tableView.reloadData()
        }) { (error) in
            NSLog("\(error)")
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Cells.newsCell, for: indexPath) as? NewsViewCell {
            let article = articles[indexPath.row]
            let authorUrl = article.authorPictureURL!
            let title = article.title!
            let content = article.content!
            let imageUrl = (article.pictureUrls?.isEmpty)! ? "" : article.pictureUrls?[0]

            cell.bind(authorUrl: authorUrl, title: title, content: content, imageUrl: imageUrl!)
            
            return cell
        }
        
        return UITableViewCell()
    }
}
