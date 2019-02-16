//
//  ViewController.swift
//  SwiftyJSONTutorial
//
//  Created by DEIK on 2018. 12. 14..
//  Copyright © 2018. Tamás Magyar. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    @IBOutlet weak var webView: WKWebView!
    
    var url: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let webUrl = URL(string: url) {
            let urlRequest = URLRequest(url: webUrl)
            webView.load(urlRequest)
        }

        
    }
 
    
}
