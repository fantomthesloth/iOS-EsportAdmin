//
//  TeamsViewCell.swift
//  EsportAdmin
//
//  Created by DEIK on 2019. 04. 17..
//  Copyright © 2019. Tamás Magyar. All rights reserved.
//

import UIKit

class TeamsViewCell: UITableViewCell {
    @IBOutlet weak var playerName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func bind(name: String) {
        playerName.text = name
    }

}
