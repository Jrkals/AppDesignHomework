//
//  PhotoViewController.swift
//  Homework2
//
//  Created by Justin on 10/12/17.
//  Copyright © 2017 Justin Kalan. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {
    
    var photo: Photo?
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = "\(photo?.title ?? " A great picture of nothing ")"
        ImageService.shared.imageForURL(url: photo?.formURL()) { (image) in
            self.imageView.image = image
        }
    }
    
    
}
