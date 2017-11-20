//
//  ViewController.swift
//  SocialMediaApp
//
//  Created by Justin on 11/13/17.
//  Copyright © 2017 Justin Kalan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate {
    
    var user: User?
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var loginField: UITextField!
    
    @IBOutlet weak var warningLabel: UILabel!
    
    // Attempt to Login, if get proper token, proceed to List of Users
    @IBAction func logInButtonTapped(_ sender: Any) {
        LoginService.shared.fetchLoginToken(username: usernameField.text, password: loginField.text){
            DispatchQueue.main.async {
                // Failed Login
                if LoginService.shared.globalToken == "" {
                    self.warningLabel.text = "Enter a valid username and password and try again"
                    self.warningLabel.isHidden = false
                }
                    // Login Succeeded
                else{
                    self.warningLabel.text = ""
                    UserDefaults.standard.set(self.usernameField.text, forKey: "username")
                    UserDefaults.standard.synchronize()
                    User.sharedUser.username = self.usernameField.text
                    User.sharedUser.token = LoginService.shared.globalToken
                    User.sharedUser.password = self.loginField.text
                    print("username is: \(User.sharedUser.username)")
                    self.performSegue(withIdentifier: "toTab", sender: self)
                }
            }
           
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

