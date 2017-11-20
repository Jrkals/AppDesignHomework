//
//  User.swift
//  SocialMediaApp
//
//  Created by Justin on 11/14/17.
//  Copyright © 2017 Justin Kalan. All rights reserved.
//

import UIKit

class User {
    static var sharedUser = User(tkn:"",usrname:"",pword:"")
    
    var token: String?
    var username: String?
    var password: String?
    
    init(tkn: String, usrname:String, pword: String) {
        token = tkn
        username = usrname
        password = pword
    }
    
    
}
