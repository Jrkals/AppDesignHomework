//
//  UserCell.swift
//  SocialMediaApp
//
//  Created by Justin on 11/14/17.
//  Copyright © 2017 Justin Kalan. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    func configure(name: String){
        nameLabel.text = name
        print(nameLabel.text)
    }
    
}
