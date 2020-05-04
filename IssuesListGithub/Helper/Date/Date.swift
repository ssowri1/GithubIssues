//
//  Dates.swift
//  IssuesListGithub
//
//  Created by Sowrirajan S on 03/05/20.
//  Copyright © 2020 com.ssowri1. All rights reserved.
//

import Foundation
let DATEFORMAT = "yyyy-MM-dd'T'HH:mm:ssZ"

extension Date {
    //This method is used to return the time
    /// - Parameter sender: Bool
    func timeAgo(numericDates: Bool) -> String {
        let components = self.getComponents()
        if components.year! >= 2 {
            return "\(components.year!) years ago"
        } else if components.year! >= 1 {
                return "1 year ago"
        } else if components.month! >= 2 {
            return "\(components.month!) months ago"
        } else if components.month! >= 1 {
                return "1 month ago"
        } else if components.weekOfYear! >= 2 {
            return "\(components.weekOfYear!) weeks ago"
        } else if components.weekOfYear! >= 1 {
                return "1 week ago"
        } else {
            return extTime()
        }
    }
    //This method is the extension for timeAgo method
    /// - Parameter sender: Any
    func extTime() -> String {
        let components = self.getComponents()
        if components.day! >= 2 {
            return "\(components.day!) days ago"
        } else if components.day! >= 1 {
            return "1 day ago"
        } else if components.hour! >= 2 {
            return "\(components.hour!) hours ago"
        } else if components.hour! >= 1 {
            return "1 hour ago"
        } else if components.minute! >= 2 {
            return "\(components.minute!) minutes ago"
        } else if components.minute! >= 1 {
            return "1 minute ago"
        } else if components.second! >= 3 {
            return "\(components.second!) seconds ago"
        } else {
            return "Just now"
        }
    }
    //This method is used to get components
    /// - Parameter sender: Any
    func getComponents() -> DateComponents {
        let date: Date = self
        let calendar = NSCalendar.current
        let unitFlags: Set<Calendar.Component> = [.minute, .hour, .day, .weekOfYear, .month, .year, .second]
        let now = NSDate()
        let earliest = now.earlierDate(date as Date)
        let latest = (earliest == (now as Date) as Date) ? date : now as Date
        let components = calendar.dateComponents(unitFlags, from: earliest as Date, to: latest as Date)
        return components
    }
    //This method is used to get the month name
    /// - Parameter sender: Any
    func getMonthName() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM"
        let strMonth = dateFormatter.string(from: self)
        return strMonth
    }
    //This method is used to return proper date with format
    /// - Parameter sender: Any
    func getDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd"
        let strMonth = dateFormatter.string(from: self)
        return strMonth
    }
}
