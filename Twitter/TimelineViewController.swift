//
//  TimelineViewController.swift
//  Twitter
//
//  Created by Jerry Su on 9/27/14.
//  Copyright (c) 2014 CodePath. All rights reserved.
//

import UIKit

class TimelineViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!

    var statuses: [Status]?

    override func viewDidLoad() {
        super.viewDidLoad()

        TwitterClient.sharedInstance.homeTimelineWithParams(nil, completion: { (statuses, error) -> () in
            self.statuses = statuses
            self.tableView.reloadData()
        })
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("statusCell") as StatusTableViewCell
        cell.status = self.statuses?[indexPath.row]
        return cell
    }


    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }

    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 200
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.statuses?.count ?? 0
    }

    @IBAction func onLogout(sender: AnyObject) {
        User.currentUser?.logout()
    }

}
