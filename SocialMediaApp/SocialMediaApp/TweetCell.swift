//
//  TweetCell.swift
//  SocialMediaApp
//
//  Created by Justin on 11/13/17.
//  Copyright © 2017 Justin Kalan. All rights reserved.
//

import UIKit
// Class which shows the text a message
class TweetCell: UITableViewCell {
    
    @IBOutlet weak var messageLabel: UILabel!
    var message: message?
    var cellID: String = ""
    // moves the message over three tabs to fit the like button
    func configure(message: String, id: String){
        messageLabel.text = "           "+message
        cellID = id
    }
    // call the like service and augment the likedBy array with the liker
    @IBAction func likeButtonTapped(_ sender: Any) {
        LikeService.shared.likePost(id: cellID){
            self.message?.likedBy?.append(User.sharedUser.username!)
            print("liked post")
        }
    }
}
