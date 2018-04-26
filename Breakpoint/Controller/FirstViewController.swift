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

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

