//
//  UserService.swift
//  SocialMediaApp
//
//  Created by Justin on 11/14/17.
//  Copyright © 2017 Justin Kalan. All rights reserved.
//

import UIKit

class UserService {
    static var sharedUsers = UserService()
    var usernames:[String] = []
    // fetches list of usernames
    func fetchData(completion:@escaping ()->()){
        let urlUser = URL(string: "https://obscure-crag-65480.herokuapp.com/users")!
        var userRequest = URLRequest(url: urlUser)
        userRequest.httpMethod = "GET"
        userRequest.addValue(User.sharedUser.token!, forHTTPHeaderField: "token")
        
        let getTask = URLSession(configuration: .ephemeral).dataTask(with: userRequest) {
            (data, response, error) in
            print("GETTING USERS")
            let users = try? JSONDecoder().decode([String].self, from: data!)
            print("response is \(response)")
            print("error is \(error)")
          //  print("data is \(data)")
            print(users!)
            self.usernames = users!
            completion()
        }
        getTask.resume()
    }
    
}
