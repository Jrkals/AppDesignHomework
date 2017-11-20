    //
    //  PostMessageViewController.swift
    //  SocialMediaApp
    //
    //  Created by Justin on 11/16/17.
    //  Copyright © 2017 Justin Kalan. All rights reserved.
    //

    import UIKit

    class PostMessageViewController:UIViewController {
        
        @IBOutlet weak var successLabel: UILabel!
        @IBOutlet weak var messageTextField: UITextField!
        
        @IBOutlet weak var imageURLTextField: UITextField!
        @IBOutlet weak var replyToTextField: UITextField!
        var replTo: String = ""
        // put the replto variable value assigned in Individual Message VC into the text field
        override func viewDidLoad() {
            super.viewDidLoad()
            replyToTextField.text = replTo
        }
        
        @IBAction func postButtonTapped(_ sender: Any) {
            successLabel.isHidden = true
            PostMessageService.shared.fetchData(text: messageTextField.text!, imageURL: imageURLTextField.text!, replyTo: replyToTextField.text!){
                DispatchQueue.main.async {
                    if(PostMessageService.shared.returnValue == "success"){
                        self.messageTextField.text = ""
                        self.imageURLTextField.text = ""
                        self.successLabel.isHidden = false // shows it
                    }
                    else{
                        self.successLabel.text = "Failure"
                        self.successLabel.isHidden = false
                    }
                }
            }
        }
        // goes back to the Individ message VC if this page is segued from there,
        // otherwise it goes back to the login screen
        @IBAction func backButtonTapped(_ sender: Any) {
            dismiss(animated: true, completion: nil)
        }
        
    }
