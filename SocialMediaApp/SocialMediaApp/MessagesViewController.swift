//
//  MessagesViewController.swift
//  SocialMediaApp
//
//  Created by Justin on 11/16/17.
//  Copyright © 2017 Justin Kalan. All rights reserved.
//

import UIKit

class MessagesViewController: UIViewController {
    
    @IBOutlet weak var messagesTableView: UITableView!
    
    var messages: [message] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messagesTableView.dataSource = self
        messagesTableView.delegate = self
        MessageService.sharedMessageService.fetchData(){
            self.messages = MessageService.sharedMessageService.messages
            DispatchQueue.main.async {
                self.messagesTableView.reloadData()
            }
        }
    }
    
    
}

extension MessagesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TweetCell") as! TweetCell
        cell.configure(message: messages[indexPath.item].text!, id: messages[indexPath.item].id!)
        cell.message = messages[indexPath.item]
        return cell
    }
}
// View more details about a given message
extension MessagesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let individualMC = storyboard.instantiateViewController(withIdentifier: "IndividualMessageViewController") as! IndividualMessageViewController
        individualMC.message = messages[indexPath.item]
        present(individualMC, animated: true, completion: nil)
    }
}
    

