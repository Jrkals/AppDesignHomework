//
//  PostMessageService.swift
//  SocialMediaApp
//
//  Created by Justin on 11/16/17.
//  Copyright © 2017 Justin Kalan. All rights reserved.
//

import UIKit

class PostMessageService {
    
    static var shared = PostMessageService()
    var returnValue: String? = ""
    
    //post a message
    func fetchData(text: String, imageURL: String, replyTo: String?, completion:@escaping ()->()){
        let newMessage: message = message(user: User.sharedUser.username, text: text, date: Date(), imgURL: URL(string:imageURL), id: nil, replyTo: replyTo, likedBy: nil)
        let urlPost = URL(string: "https://obscure-crag-65480.herokuapp.com/messages")!
        var userRequest = URLRequest(url: urlPost)
        userRequest.httpMethod = "POST"
        userRequest.addValue(User.sharedUser.token!, forHTTPHeaderField: "token")
        let data = try? JSONEncoder().encode(newMessage)
        userRequest.httpBody = data!
        
        let postTask = URLSession(configuration: .ephemeral).dataTask(with: userRequest) {
            (data, response, error) in
            print("POSTING TWEET")
            let success = try? JSONDecoder().decode(String.self, from: data!)
            print("response is \(response)")
            print("error is \(error)")
            print("data is \(data)")
          //  print(success!)
            self.returnValue = "success"
            completion()
        }
        postTask.resume()
    }
    
}
