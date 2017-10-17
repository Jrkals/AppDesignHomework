//
//  ImageService.swift
//  Homework2
//
//  Created by Justin on 10/12/17.
//  Copyright © 2017 Justin Kalan. All rights reserved.
//

import UIKit

class ImageService {
    
    static var shared = ImageService()
    
    var cache:[URL:UIImage] = [:]
    // fetch images if they are not alreay stored in cache, then store them in the cache dict
    func imageForURL(url: URL?, completion: @escaping (UIImage?) -> ()) {
        guard let url = url else { completion(nil); return }
        if let image = cache[url]{
            completion(image)
            return
        }
        let task = URLSession(configuration: .ephemeral).dataTask(with: url) { (data, response, error) in
            guard data != nil else { completion(nil); return}
            if error != nil { completion(nil); return }
            let image = UIImage(data: data!)
            if let img = image {
                self.cache[url] = img
            }
            DispatchQueue.main.async {
                completion(image)
            }
        }
        task.resume()
    }
    
}
