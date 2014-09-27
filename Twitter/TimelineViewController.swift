//
//  TimelineViewController.swift
//  Twitter
//
//  Created by Jerry Su on 9/27/14.
//  Copyright (c) 2014 CodePath. All rights reserved.
//

import UIKit

class TimelineViewController: UIViewController {

    var statuses: [Status]?

    override func viewDidLoad() {
        super.viewDidLoad()

        TwitterClient.sharedInstance.homeTimelineWithParams(nil, completion: { (statuses, error) -> () in
            self.statuses = statuses

            for status in statuses! {
                println("text: \(status.text), created: \(status.createdAt)")
            }
        })
    }

    @IBAction func onLogout(sender: AnyObject) {
        User.currentUser?.logout()
    }

}
