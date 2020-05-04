//
//  ListTableViewCell.swift
//  IssuesListGithub
//
//  Created by Sowrirajan S on 03/05/20.
//  Copyright © 2020 com.ssowri1. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var issueDetails: UILabel!
    @IBOutlet weak var logo: UIImageView!
    
    var data: IssueListElement? {
        didSet {
            if let data = data {
                logo.image = UIImage.init(named: data.state)
                titleLabel.text = data.title
                issueDetails.text = concatenateString(data: data)
            }
        }
    }
    
    func concatenateString(data: IssueListElement) -> String {
        return "#" + "\(data.number)" + " by " + data.user.login  + " was " +  data.createdAt!.stringtoDate(format: DATEFORMAT).timeAgo(numericDates: true)
    }
}
