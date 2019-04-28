//
//  EntryViewCell.swift
//  EsportAdmin
//
//  Created by DEIK on 2019. 04. 28..
//  Copyright © 2019. Tamás Magyar. All rights reserved.
//

import UIKit

class EntryViewCell: UITableViewCell {
    @IBOutlet weak var entryNameLabel: UILabel!
    @IBOutlet weak var entryTeamLabel: UILabel!
    @IBOutlet weak var entryInfoLabel: UILabel!
    @IBOutlet weak var entryDateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func bind(name: String, team: String, info: String, date: String) {
        entryNameLabel.text = name
        entryTeamLabel.text = team
        entryInfoLabel.text = info
        entryDateLabel.text = date
    }

}
