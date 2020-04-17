//
//  GitUserCell.swift
//  GitTest
//
//  Created by Admin on 14/04/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

class GitUserCell: UITableViewCell {

    @IBOutlet weak var imgUser: UIImageView!
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var lblRepoCount: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
}
