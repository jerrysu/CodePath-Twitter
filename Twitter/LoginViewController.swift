//
//  ViewController.swift
//  Twitter
//
//  Created by Jerry Su on 9/24/14.
//  Copyright (c) 2014 CodePath. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func onLogin(sender: AnyObject) {
        TwitterClient.sharedInstance.loginWithCompletion() {
            (user: User?, error: NSError?) in
            if user != nil {
                self.performSegueWithIdentifier("loginSegue", sender: self)
            } else {
                // Handle login error
            }
        }

    }
}