//
//  FancySignBtn.swift
//  Social Network
//
//  Created by Levon Tikoyan on 12/3/16.
//  Copyright © 2016 Levon Tikoyan. All rights reserved.
//

import UIKit

class FancySignBtn: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        layer.shadowColor = UIColor(red: SHADOW_GRAY, green: SHADOW_GRAY, blue: SHADOW_GRAY, alpha: 0.8).cgColor
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 5.0
        layer.shadowOffset = CGSize(width: 2.0 , height: 2.0)
        layer.cornerRadius = 2.0
    }

}
