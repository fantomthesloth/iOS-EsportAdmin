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
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func bind(title: String, description: String, imageUrl: String) {
        let url = URL(string: imageUrl)
        articleTitle.text = title
        articleDescription.text = description
        articleImage.sd_setImage(with: url)
    }

}
