//
//  DataService.swift
//  Breakpoint
//
//  Created by Nessin Elkharrat on 4/19/18.
//  Copyright © 2018 practice. All rights reserved.
//

import Foundation
import Firebase

let DB_BASE = FIRDatabase.database().reference()

class DataService {
    //singleton
    static let instance = DataService()
    
    private var _REF_BASE = DB_BASE
    
    private var _REF_USERS = DB_BASE.child("users")
    
    private var _REF_GROUPS = DB_BASE.child("groups")
    
    private var _REF_FEED = DB_BASE.child("feed")
    
    var REF_BASE: FIRDatabaseReference {
        return _REF_BASE
    }
    
    var REF_USER: FIRDatabaseReference {
        return _REF_USERS
    }
    
    var REF_GROUPS: FIRDatabaseReference {
        return _REF_GROUPS
    }
    
    var REF_FEED: FIRDatabaseReference {
        return _REF_FEED
    }
    
    //uid = unique id
    func createDBUser(uid: String, userData: Dictionary<String, Any>) {
        //update child values allows you to update the dictionary with values
        REF_USER.child(uid).updateChildValues(userData)
    }
    
    //throws a message up into firebase
    func uploadPost(withMessage message: String, forUID uid: String, withGroupKey groupKey: String?, sendComplete: SENDCOMPLETE) {
        //if there IS a group key (that already exists?)
        if groupKey != nil {
            //sends to group reference
        }else{
            //childByAutoId = unique identifier to each individual message. update with a dictionary
            REF_FEED.childByAutoId().updateChildValues(["content":message, "senderId":uid])
            sendComplete(true)
        }
        
    }
    
    //Want to pull info from the Feed reference (_RED_FFEED), then want to pass data out of closure so we use a handler for that
    func getAllFeedMessages(handler: @escaping (_ messages: [Message]) -> ()) {
        var messageArray = [Message]()
        //Observe single event after loading every message from feed array
        REF_FEED.observeSingleEvent(of: .value) { (feedMessageSnapshot) in
            guard let feedMessageSnapshot = feedMessageSnapshot.children.allObjects as? [FIRDataSnapshot] else { return }
            
            //going to cycle through the FirDataSnapshot array and store all the messages in Message array
            for message in feedMessageSnapshot {
                // The string "content" is a reference to what the name of the data section in firebase is called
                let content = message.childSnapshot(forPath: "content").value as! String
                let senderId = message.childSnapshot(forPath: "senderId").value as! String
                let message = Message(content: content, senderId: senderId)
                messageArray.append(message)
            }
            handler(messageArray)
        }
    }
    
}
