//
//  FirstViewController.swift
//  Breakpoint
//
//  Created by Nessin Elkharrat on 4/18/18.
//  Copyright © 2018 practice. All rights reserved.


//firebase.google.com -> go to console -> add project
//go to IOS project and put in bundle ID which is in settings under identity -> "com.practice.Breakpoint"
//Download plist and drag into project
//Install cocoa pod

//type into terminal $pod init
// open podfile and type in "pod 'Firebase/Core'"
//pod 'Firebase/Database'
//pod 'Firebase/Auth'

//terminal - pod install

//open XCworkspace

//go to app delegate and import firebase
//go to didFinishLaunchingWithOptions and add FirebaseApp.configure()

import UIKit

class FeedVC: UIViewController {
    
    //Outlets
    @IBOutlet weak var tableView: UITableView!
    
    //Variables
    var messageArray = [Message]()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    //Want the first thing to be done is to call all the messages and put them in an array
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DataService.instance.getAllFeedMessages { (returnedMessagesArray) in
            self.messageArray = returnedMessagesArray
            self.tableView.reloadData()
        }
    }

}

extension FeedVC: UITableViewDelegate,UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "feedCell") as? FeedCell else {
            return UITableViewCell()
        }
        let image = UIImage(named: "defaultProfileImage")
        let message = messageArray[indexPath.row]
        
        cell.configureCell(profileImg: image!, email: message.senderId, content: message.content)
        
        return cell
    }
}

