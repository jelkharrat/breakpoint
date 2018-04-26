//
//  ShadowView.swift
//  Breakpoint
//
//  Created by Nessin Elkharrat on 4/26/18.
//  Copyright © 2018 practice. All rights reserved.
//

import UIKit

class ShadowView: UIView {
    
    override func awakeFromNib() {
        setUpView()
        super.awakeFromNib()
    }
    
    func setUpView() {
        self.layer.opacity = 0.75
        self.layer.shadowRadius = 5
        self.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
}
