//
//  AppConstants.swift
//  IssuesListGithub
//
//  Created by Sowrirajan S on 03/05/20.
//  Copyright © 2020 com.ssowri1. All rights reserved.
//

import UIKit

struct ApiConstansts {
    // scheme
    static let scheme: String = "https"
    // host
    static let host: String = "api.github.com"
    // path
    static let path: String = "/repos/alamofire/alamofire/issues"
}

struct UrlQuery: Codable {
    var state: State?
    var page: Int
}

enum State: String, Codable {
    case open = "open"
    case closed = "closed"
}

struct CellIdentifier {
    // issues tableView cell
    static let issuesTableViewCell: String = "issuesTableViewCell"
}

struct SegueIdentifier {
    static let issuestodetail = "issuestodetail"
}

struct AppConstants {
    static let detailController = "Issue in Detail"
}
