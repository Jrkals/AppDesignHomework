//
//  LoginService.swift
//  SocialMediaApp
//
//  Created by Justin on 11/14/17.
//  Copyright © 2017 Justin Kalan. All rights reserved.
//

import UIKit

struct login: Codable{
        var name: String?
        var password: String?
}

struct token: Codable {
    var token: String
}

class LoginService {
    static var shared = LoginService()
    var globalToken: String? = ""
    
    //fetch token given login credentials
    func fetchLoginToken(username: String?, password: String?, completion:@escaping ()->()){
        let myLogin = login(name: username, password: password)
        let data = try? JSONEncoder().encode(myLogin)
        let url = URL(string: "https://obscure-crag-65480.herokuapp.com/login")
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.httpBody = data
        let postTask = URLSession(configuration: .ephemeral).dataTask(with: request) {
            (data, response, error) in
            print("GETTING TOKEN")
            print(data)
         //   print(response)
            print(error)
            let t = try? JSONDecoder().decode(token.self, from: data!)
            self.globalToken = t?.token ?? ""
            print("global token is \(self.globalToken)")
            completion()
            }
            postTask.resume()
    }
    
    
}
