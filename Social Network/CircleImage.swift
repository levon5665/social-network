//
//  CircleImage.swift
//  Social Network
//
//  Created by Levon Tikoyan on 12/4/16.
//  Copyright © 2016 Levon Tikoyan. All rights reserved.
//

import UIKit

class CircleImage: UIImageView {

    override func awakeFromNib() {
        super.awakeFromNib()
        layer.shadowColor = UIColor(red: SHADOW_GRAY, green: SHADOW_GRAY, blue: SHADOW_GRAY, alpha: 0.8).cgColor
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 5.0
        layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
    }

    override func layoutSubviews() {
        layer.cornerRadius = self.frame.width / 2
    }
    
}
