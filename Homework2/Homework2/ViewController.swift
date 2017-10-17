//
//  ViewController.swift
//  Homework2
//
//  Created by Justin on 10/12/17.
//  Copyright © 2017 Justin Kalan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var photos: [Photo] = []
    
    @IBOutlet weak var pictureCollection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pictureCollection.dataSource = self
        pictureCollection.delegate = self
        fetchData()
    }
    
    // get json from url and then put the necessary information into an array of Photos
    func fetchData(){
        let url = URL(string: "https://api.flickr.com/services/rest/?format=json&sort=random&method=flickr.photos.search&tags=daffodil&tag_mode=all&api_key=0e2b6aaf8a6901c264acb91f151a3350&nojsoncallback=1")!
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { (data, response, err) in
            let data = data!
            let json = try! JSONSerialization.jsonObject(with: data, options: [])
            let dictionary = json as! [String: Any]
            let photosDict: [String: Any] = dictionary["photos"] as! [String: Any] //all data is in dictionary
            let photosArray: [[String:Any]] = photosDict["photo"] as! Array // the photos are in an array of dictionaries
            for ph in photosArray {
                self.photos.append(Photo(dictionary: ph))
            }
            DispatchQueue.main.async {
                self.pictureCollection.reloadData()
            }
        }
        task.resume()
    }


}

// show the cell with a picture of the fetched image
extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PictureCell", for: indexPath) as! PictureCell
        cell.pictureName.text = photos[indexPath.item].title
        ImageService.shared.imageForURL(url: photos[indexPath.item].formURL()) { (image) in
            cell.imageView.image = image
        }
        return cell
    }
}

// switch view controllers when one image is tapped
extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let photoViewController = storyboard.instantiateViewController(withIdentifier: "PhotoViewController") as! PhotoViewController
        photoViewController.photo = photos[indexPath.item]
        present(photoViewController, animated: true, completion: nil)
        
    }
}

