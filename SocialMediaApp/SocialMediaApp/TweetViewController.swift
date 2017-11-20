//
//  TweetViewController.swift
//  SocialMediaApp
//
//  Created by Justin on 11/13/17.
//  Copyright © 2017 Justin Kalan. All rights reserved.
//

import UIKit
// View Controller Showing the Tweet Users
class TweetViewController: UIViewController {
        
    @IBOutlet weak var tableView: UITableView!
    
    var usernames: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        UserService.sharedUsers.fetchData() {
            self.usernames = UserService.sharedUsers.usernames
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}
// Go to an individual user to send a DM
extension TweetViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let individualVC = storyboard.instantiateViewController(withIdentifier: "IndividualUserViewController") as! IndividualUserViewController
        individualVC.name = usernames[indexPath.item]
        present(individualVC, animated: true, completion: nil)
    }
}

extension TweetViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usernames.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell") as! UserCell
        cell.configure(name: usernames[indexPath.item])
        return cell
    }
}
