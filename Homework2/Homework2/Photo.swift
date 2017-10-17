//
//  Photo.swift
//  Homework2
//
//  Created by Justin on 10/12/17.
//  Copyright © 2017 Justin Kalan. All rights reserved.
//

import Foundation

struct Photo {
    let id: String
    let owner: String
    let secret: String
    let server: String
    let farm: Int
    let title: String
    let isPublic: Int
    let isFriend: Int
    let isFamily: Int
    
    init(id: String, owner: String, secret: String, server: String, farm: Int, title: String,
        isPublic: Int, isFriend: Int, isFamily: Int){
        self.id = id
        self.owner = owner
        self.secret = secret
        self.server = server
        self.farm = farm
        self.title = title
        self.isPublic = isPublic
        self.isFamily = isFamily
        self.isFriend = isFriend
    }
    
    init(dictionary: [String: Any]){
        self.init(id: dictionary["id"] as! String,
                  owner: dictionary["owner"] as! String,
                  secret: dictionary["secret"] as! String,
                  server: dictionary["server"] as! String,
                  farm: dictionary["farm"] as! Int,
                  title: dictionary["title"] as! String,
                  isPublic: dictionary["ispublic"]as! Int,
                  isFriend: dictionary["isfriend"]as! Int,
                  isFamily: dictionary["isfamily"]as! Int)
    }
    
    // concatinates the data into the URL string and then returns the proper URL
    // the compiler yelled at me when I tried to do it in one line hence the 6 lines of concatenation
    // i'm sure there is a faster way but this works fine
    func formURL() -> URL{
        var urlString: String = ""
        urlString = "https://farm" + String(self.farm)
        urlString = urlString + ".static.flickr.com/"
        urlString = urlString + String(self.server)
        urlString = urlString + "/" + String(self.id)
        urlString = urlString + "_"
        urlString = urlString + String(self.secret) + ".jpg"
        let url = URL(string: urlString)
        return url!
    }
    
    
}
