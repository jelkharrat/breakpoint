//
//  Message.swift
//  Breakpoint
//
//  Created by Nessin Elkharrat on 5/8/18.
//  Copyright © 2018 practice. All rights reserved.
//

import Foundation

class Message  {
    private var _content: String
    private var _senderId: String
    
    //the public variable can be accesssed by the private value.
    var content: String {
        return _content
    }
    
    var senderId :String {
        return _senderId
    }
    
    //only through initializers can the private variable value be set
    init(content:String, senderId:String) {
        self._senderId = content
        self._content = content
    }
}
