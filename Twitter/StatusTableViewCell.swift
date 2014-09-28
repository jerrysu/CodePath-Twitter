//
//  StatusTableViewCell.swift
//  Twitter
//
//  Created by Jerry Su on 9/27/14.
//  Copyright (c) 2014 CodePath. All rights reserved.
//

import UIKit

class StatusTableViewCell: UITableViewCell {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var screennameLabel: UILabel!
    @IBOutlet weak var statusTextLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!

    var status: Status? {
        willSet(newValue) {
            self.profileImage.setImageWithURL(newValue?.user.profileImageUrl)
            self.nameLabel.text = newValue?.user.name
            self.screennameLabel.text = "@\(newValue!.user.screenname)"
            self.statusTextLabel.text = newValue?.text
            self.timeLabel.text = newValue?.createdAt.timeAgo()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()

        self.profileImage.layer.cornerRadius = 9.0
        self.profileImage.layer.masksToBounds = true
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
