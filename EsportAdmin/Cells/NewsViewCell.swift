//
//  TableViewCell.swift
//  SwiftyJSONTutorial
//
//  Created by DEIK on 2018. 12. 14..
//  Copyright © 2018. Tamás Magyar. All rights reserved.
//

import UIKit
import SDWebImage

class NewsViewCell: UITableViewCell {
    @IBOutlet weak var articleTitle: UILabel!
    @IBOutlet weak var articleDescription: UILabel!
    @IBOutlet weak var articleImage: UIImageView!
    @IBOutlet weak var articleAuthorImage: UIImageView!
    @IBOutlet weak var articeImageWidthConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        articleAuthorImage.layer.cornerRadius = articleAuthorImage.frame.size.width / 2
        articleAuthorImage.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func bind(authorUrl: String, title: String, content: String, imageUrl: String) {
        let imageUrl = URL(string: imageUrl)
        let authorUrl = URL(string: authorUrl)
        articleAuthorImage.sd_setImage(with: authorUrl)
        articleTitle.text = title
        articleDescription.text = content
        articleImage.sd_setImage(with: imageUrl)
    }
}
