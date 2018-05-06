//
//  MeVC.swift
//  Breakpoint
//
//  Created by Nessin Elkharrat on 5/6/18.
//  Copyright © 2018 practice. All rights reserved.
//

import UIKit

class MeVC: UIViewController {
    
    //Outlets
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var tableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signOutBtnWasPressed(_ sender: Any) {
    }
    
}
