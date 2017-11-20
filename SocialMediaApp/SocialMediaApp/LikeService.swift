//
//  LikeService.swift
//  SocialMediaApp
//
//  Created by Justin on 11/16/17.
//  Copyright © 2017 Justin Kalan. All rights reserved.
//

import UIKit

struct messageId: Codable {
    var likedMessageID: String?
    
}

class LikeService {
    static let shared = LikeService()
    // like a post
    func likePost(id: String, completion:@escaping ()->()){
        // print("id is \(id)")
        let urlLike = URL(string: "https://obscure-crag-65480.herokuapp.com/like")!
        var userRequest = URLRequest(url: urlLike)
        userRequest.httpMethod = "POST"
        userRequest.addValue(User.sharedUser.token!, forHTTPHeaderField: "token")
        let msgId: messageId = messageId(likedMessageID: id)
        let data = try? JSONEncoder().encode(msgId)
        userRequest.httpBody = data!
        let postTask = URLSession(configuration: .ephemeral).dataTask(with: userRequest) {
            (data, response, error) in
            print("LIKING TWEET")
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
