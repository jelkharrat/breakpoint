//
//  AuthVC.swift
//  Breakpoint
//
//  Created by Nessin Elkharrat on 4/24/18.
//  Copyright © 2018 practice. All rights reserved.
//

//This VC has a storyboard ID and will be called upon in other VCs

import UIKit

class AuthVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signInByEmailWasPressed(_ sender: Any) {
        let logInVC = storyboard?.instantiateViewController(withIdentifier: "LoginVC")
        
        present(logInVC!, animated: true, completion: nil)
    }
    
    @IBAction func facebookSignInWasPressed(_ sender: Any) {
    }
    
    
    @IBAction func googleSignInWasPressed(_ sender: Any) {
    }
}
