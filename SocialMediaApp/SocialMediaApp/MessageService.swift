//
//  MessageService.swift
//  SocialMediaApp
//
//  Created by Justin on 11/16/17.
//  Copyright © 2017 Justin Kalan. All rights reserved.
//

import UIKit

struct message: Codable {
    var user: String?
    var text: String?
    var date: Date?
    var imgURL: URL?
    var id: String?
    var replyTo: String?
    var likedBy: [String]?
}


class MessageService {
    static let sharedMessageService = MessageService()
    var messages: [message] = []
    // fetch list of messages
    func fetchData(completion:@escaping ()->()){
        let urlUser = URL(string: "https://obscure-crag-65480.herokuapp.com/messages")!
        var userRequest = URLRequest(url: urlUser)
        userRequest.httpMethod = "GET"
        userRequest.addValue(User.sharedUser.token!, forHTTPHeaderField: "token")
        
        let getTask = URLSession(configuration: .ephemeral).dataTask(with: userRequest) {
            (data, response, error) in
            print("GETTING MESSAGES")
            let messages = try? JSONDecoder().decode([message].self, from: data!)
            print("response is \(response)")
            print("error is \(error)")
            print("data is \(data)")
           // print(messages!)
            self.messages = messages!
            completion()
        }
        getTask.resume()
    }
    
    
}
