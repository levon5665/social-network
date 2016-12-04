//
//  PostCell.swift
//  Social Network
//
//  Created by Levon Tikoyan on 12/5/16.
//  Copyright © 2016 Levon Tikoyan. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {
    
    
    @IBOutlet weak var profileImage: CircleImage!
    @IBOutlet weak var usernameLbl: UILabel!
    @IBOutlet weak var postImg: UIImageView!
    @IBOutlet weak var cationText: UITextView!
    @IBOutlet weak var likesLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
