//
//  CreatePostVC.swift
//  Breakpoint
//
//  Created by Nessin Elkharrat on 5/6/18.
//  Copyright © 2018 practice. All rights reserved.
//

import UIKit
import Firebase

class CreatePostVC: UIViewController {
    //Outlets
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var sendBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.delegate = self
        sendBtn.bindToKeyboard()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sendBtnWasPressed(_ sender: Any) {
        if textView.text != nil && textView.text == "Say something here..." {
            sendBtn.isEnabled = false
        } else {
            DataService.instance.uploadPost(withMessage: textView.text, forUID: (FIRAuth.auth()?.currentUser?.uid)!, withGroupKey: nil, sendComplete: { (isComplete) in
                if isComplete {
                    self.sendBtn.isEnabled = true
                    self.dismiss(animated: true, completion: nil)
                } else {
                   self.sendBtn.isEnabled = true
                    print("THERE WAS AN ERROR")
                }
            })
        }
    }
    
    @IBAction func closedBtnWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}

extension CreatePostVC: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.text = ""
    }
}
