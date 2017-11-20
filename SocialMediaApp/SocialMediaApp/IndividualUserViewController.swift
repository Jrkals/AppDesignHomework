//
//  IndividualUserViewController.swift
//  SocialMediaApp
//
//  Created by Justin on 11/14/17.
//  Copyright © 2017 Justin Kalan. All rights reserved.
//

import UIKit

class IndividualUserViewController: UIViewController {
    var name: String = ""
    @IBOutlet weak var toField: UITextField!
    
    @IBOutlet weak var messageField: UITextField!
    
    @IBOutlet weak var successLabel: UILabel!
    
    @IBAction func backButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    // automatically sets the toField when the cell is clicked in the Tweet VC
    override func viewDidLoad() {
        toField.text = name
    }
    
    @IBAction func sendButtonTapped(_ sender: Any) {
        if(toField.text == "" || messageField.text == ""){
            self.successLabel.text = "Both fields must be filled"
            self.successLabel.isHidden = false
        }
        else{            
            DirectService.shared.sendDirectMessage(to: self.toField.text!, from: User.sharedUser.username!, text: self.messageField.text!){
                DispatchQueue.main.async {
                    print("message sent")
                    self.successLabel.isHidden = false
                }
            }
        
        }
    }
    
}
