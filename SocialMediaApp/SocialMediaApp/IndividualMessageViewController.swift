//
//  IndividualMessageViewController.swift
//  SocialMediaApp
//
//  Created by Justin on 11/19/17.
//  Copyright © 2017 Justin Kalan. All rights reserved.
//

import UIKit

class IndividualMessageViewController: UIViewController {
        
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var messageLabel: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var numLikesLabel: UILabel!
    
    @IBOutlet weak var authorLabel: UILabel!
    var message: message?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        authorLabel.text = "Anonymous" // default unless there is a name with the message
        // otherwise find the name
        if let nonEmptyName = message?.user{
            authorLabel.text = message?.user
        }
        messageLabel.text = message?.text
        dateLabel.text = message?.date?.description
        numLikesLabel.text = String(message!.likedBy!.count)
        // Fetch Image if there is an image URL
        if(message?.imgURL?.absoluteString != ""){
            ImageService.shared.imageForURL(url: message?.imgURL){ (image, url) in
                self.imageView.image = image
            }
                
            
        }
        
    }
    // pass the reply to id to the text field in the PostMesVC so that it's already filled out whe
    // the segue is performed
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? PostMessageViewController else { return }
        guard let source = sender as? IndividualMessageViewController else { return }
        destination.replTo = source.message!.id!
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func replyButtonTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "ReplyTweet", sender: self)
    }
}
