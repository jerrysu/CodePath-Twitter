//
//  StatusViewController.swift
//  Twitter
//
//  Created by Jerry Su on 9/30/14.
//  Copyright (c) 2014 CodePath. All rights reserved.
//

import UIKit

class StatusViewController: UIViewController {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var screennameLabel: UILabel!
    @IBOutlet weak var statusTextLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var retweetNumberLabel: UILabel!
    @IBOutlet weak var favoriteNumberLabel: UILabel!

    var status: Status?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Tweet"

        self.profileImage.setImageWithURL(self.status?.user.profileImageUrl)
        self.profileImage.layer.cornerRadius = 9.0
        self.profileImage.layer.masksToBounds = true
        self.nameLabel.text = self.status?.user.name
        self.screennameLabel.text = "@\(self.status!.user.screenname)"
        self.statusTextLabel.text = self.status?.text

        var formatter = NSDateFormatter()
        formatter.dateFormat = "MMMM dd, yyyy 'at' h:mm aaa"
        self.dateLabel.text = formatter.stringFromDate(self.status!.createdAt)

        self.retweetNumberLabel.text = "\(self.status!.numberOfRetweets)"
        self.favoriteNumberLabel.text = "\(self.status!.numberOfFavorites)"
    }

}
