//
//  FancyText.swift
//  Social Network
//
//  Created by Levon Tikoyan on 12/3/16.
//  Copyright © 2016 Levon Tikoyan. All rights reserved.
//

import UIKit

class FancyText: UITextField {

    override func awakeFromNib() {
        super.awakeFromNib()       
        layer.borderColor = UIColor(red: SHADOW_GRAY, green: SHADOW_GRAY, blue: SHADOW_GRAY, alpha: 0.2).cgColor
        layer.borderWidth = 1.0
        layer.masksToBounds = false
        layer.shadowRadius = 3.0
        layer.shadowColor = UIColor(red: SHADOW_GRAY, green: SHADOW_GRAY, blue: SHADOW_GRAY, alpha: 0.2).cgColor
        layer.shadowOffset = CGSize(width : 1.0, height: 1.0)
        layer.shadowOpacity = 1.0
        layer.cornerRadius = 2.0
    }

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 5, dy: 5)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 5, dy: 5)
    }
}
