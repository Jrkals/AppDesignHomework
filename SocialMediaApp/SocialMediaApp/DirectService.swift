//
//  DirectService.swift
//  SocialMediaApp
//
//  Created by Justin on 11/18/17.
//  Copyright © 2017 Justin Kalan. All rights reserved.
//

import UIKit

struct direct: Codable {
    let to: String?
    let from: String?
    let message: message
}

class DirectService {
    static var shared = DirectService()
    // post a direct message
    func sendDirectMessage(to:String, from:String, text: String, completion:@escaping ()->()){
        let msg:message = message(user: User.sharedUser.username, text: text, date: Date(), imgURL: nil, id: nil, replyTo: nil, likedBy: [])
        let directMessage: direct = direct(to: to, from: from, message: msg)
       
        let urlDirect = URL(string: "https://obscure-crag-65480.herokuapp.com/direct")!
        var userRequest = URLRequest(url: urlDirect)
        userRequest.httpMethod = "POST"
        userRequest.addValue(User.sharedUser.token!, forHTTPHeaderField: "token")
        let data = try? JSONEncoder().encode(directMessage)
        userRequest.httpBody = data!
        
        let postTask = URLSession(configuration: .ephemeral).dataTask(with: userRequest) {
            (data, response, error) in
            print("Direct Message")
            let success = try? JSONDecoder().decode(String.self, from: data!)
            print("response is \(response)")
            print("error is \(error)")
            print("data is \(data)")
            //  print(success!)
            completion()
        }
        postTask.resume()
    }
    
}
