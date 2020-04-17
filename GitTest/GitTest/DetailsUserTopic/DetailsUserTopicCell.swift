//
//  DetailsUserTopicCell.swift
//  GitTest
//
//  Created by Admin on 15/04/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

class DetailsUserTopicCell: UITableViewCell {

    @IBOutlet weak var lblRepoName: UILabel!
    @IBOutlet weak var lblFroks: UILabel!
    @IBOutlet weak var lblStars: UILabel! 
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
