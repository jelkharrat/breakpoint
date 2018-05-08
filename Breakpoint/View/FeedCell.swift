//
//  FeedCell.swift
//  Breakpoint
//
//  Created by Nessin Elkharrat on 5/6/18.
//  Copyright © 2018 practice. All rights reserved.
//

import UIKit

class FeedCell: UITableViewCell {
    //Outlets
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var contentLbl: UILabel!
    
    func configureCell(profileImg: UIImage, email: String, content: String) {
        self.profileImg.image = profileImg
        self.emailLbl.text = email
        self.contentLbl.text = content
    }
}
