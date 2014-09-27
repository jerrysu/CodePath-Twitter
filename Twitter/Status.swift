//
//  Status.swift
//  Twitter
//
//  Created by Jerry Su on 9/25/14.
//  Copyright (c) 2014 CodePath. All rights reserved.
//

import UIKit

class Status: NSObject {

    var user: User
    var text: String
    var createdAtString: String
    var createdAt: NSDate

    init(dictionary: NSDictionary) {
        self.user = User(dictionary: dictionary["user"] as NSDictionary)
        self.text = dictionary["text"] as String
        self.createdAtString = dictionary["created_at"] as String

        var formatter = NSDateFormatter()
        formatter.dateFormat = "EEE MMM d HH:mm:ss Z y"
        self.createdAt = formatter.dateFromString(self.createdAtString)!
    }

    class func statusesWithArray(array: [NSDictionary]) -> [Status] {
        var statuses = [Status]()
        for dictionary in array {
            statuses.append(Status(dictionary: dictionary))
        }
        return statuses
    }
}
