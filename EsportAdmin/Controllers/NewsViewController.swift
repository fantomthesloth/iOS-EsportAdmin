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


class NewsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addNewArticleButton: UIButton!
    
    var articles: [News] = []
    var loadingScreen: LoadingScreen?
    var myUser: MyUser?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialSetup()
        addLoadingScreen()
        getNews()
    }
    
    func initialSetup() {
//        tableView.isUserInteractionEnabled = false
        addNewArticleButton.titleLabel?.baselineAdjustment = .alignCenters
        addNewArticleButton.layer.cornerRadius = addNewArticleButton.frame.height/2.0
        addNewArticleButton.setImage(UIImage(named: "add (1).png")?.imageWithColor(color1: .white), for: .normal)
    }
    
    func addLoadingScreen() {
        loadingScreen = LoadingScreen(frame: self.view.frame)
        self.view.addSubview(loadingScreen!)
        self.view.bringSubviewToFront(loadingScreen!)
    }
    
    func removeLoadingScreen() {
        loadingScreen?.removeFromSuperview()
    }
    
    func getNews() {
        articles.removeAll()
        let url = "\(Constants.BaseApiUrl.url)/news/listMyNews"
        
        RestClient.shared.get(url: url, with: nil, isTokenNeeded: true, success: { (response) in
            for news in response {
                self.articles.append(News(json: news.1))
            }
            self.tableView.reloadData()
            self.removeLoadingScreen()
        }) { (error) in
            NSLog("\(error)")
        }
        RestClient.loadUser(delegate: self)
    }
    
    @IBAction func showAddArticle(_ sender: Any) {
        let vc: AddArticleViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AddArticleViewController") as! AddArticleViewController
        vc.parentVC = self
        vc.myUser = self.myUser
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension NewsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Cells.newsCell, for: indexPath) as? NewsViewCell {
            let article = articles[indexPath.row]
            let authorUrl = article.authorPictureURL!
            let title = article.title!
            let content = article.content!
            let imageUrl = (article.pictureUrls?.isEmpty)! ? "" : article.pictureUrls?[0]
            
            cell.bind(authorUrl: authorUrl, title: title, content: content, imageUrl: imageUrl!)
            
            tableView.tableFooterView = UIView()
            return cell
        }
        return UITableViewCell()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
}

extension NewsViewController: LoadProfileDelegate {
    func loadProfileDidSuccess(response: MyUser) {
        self.myUser = response
    }
    
    func loadProfileDidFail(error: Error?) {
        NSLog("⚠️ Loading profile failed")
    }
    
    
}
