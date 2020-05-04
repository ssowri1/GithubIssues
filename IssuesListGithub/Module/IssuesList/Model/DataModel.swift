//
//  DataModel.swift
//  IssuesListGithub
//
//  Created by Sowrirajan S on 03/05/20.
//  Copyright © 2020 com.ssowri1. All rights reserved.
//

import UIKit
import Foundation

// MARK: - IssueListElement
struct IssueListElement: Codable {
    let url, repositoryURL: String
    let labelsURL: String
    let commentsURL, eventsURL, htmlURL: String
    let id: Int
    let nodeID: String
    let number: Int
    let title: String
    let user: User
    let labels: [Label]
    let state: String
    let locked: Bool
    let assignee: User?
    let assignees: [User]
    let comments: Int
    let createdAt, updatedAt, closedAt: String?
    let pullRequest: PullRequest?
    let body: String
    
    enum CodingKeys: String, CodingKey {
        case url
        case repositoryURL = "repository_url"
        case labelsURL = "labels_url"
        case commentsURL = "comments_url"
        case eventsURL = "events_url"
        case htmlURL = "html_url"
        case id
        case nodeID = "node_id"
        case number, title, user, labels, state, locked, assignee, assignees, comments
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case closedAt = "closed_at"
        case pullRequest = "pull_request"
        case body
    }
}

// MARK: - User
struct User: Codable {
    let login: String
    let id: Int
    let nodeID: String
    let avatarURL: String
    let gravatarID: String
    let url, htmlURL, followersURL: String
    let followingURL, gistsURL, starredURL: String
    let subscriptionsURL, organizationsURL, reposURL: String
    let eventsURL: String
    let receivedEventsURL: String
    let type: TypeEnum
    let siteAdmin: Bool

    enum CodingKeys: String, CodingKey {
        case login, id
        case nodeID = "node_id"
        case avatarURL = "avatar_url"
        case gravatarID = "gravatar_id"
        case url
        case htmlURL = "html_url"
        case followersURL = "followers_url"
        case followingURL = "following_url"
        case gistsURL = "gists_url"
        case starredURL = "starred_url"
        case subscriptionsURL = "subscriptions_url"
        case organizationsURL = "organizations_url"
        case reposURL = "repos_url"
        case eventsURL = "events_url"
        case receivedEventsURL = "received_events_url"
        case type
        case siteAdmin = "site_admin"
    }
}

enum TypeEnum: String, Codable {
    case user = "User"
}

enum AuthorAssociation: String, Codable {
    case contributor = "CONTRIBUTOR"
    case none = "NONE"
}

// MARK: - Label
struct Label: Codable {
    let id: Int
    let url: String
    let labelDefault: Bool
    let labelDescription: String?

    enum CodingKeys: String, CodingKey {
        case id
        case url
        case labelDefault = "default"
        case labelDescription = "description"
    }
}

enum Color: String, Codable {
    case b60205 = "b60205"
    case fc6808 = "FC6808"
    case the9559F0 = "9559F0"
}

enum Name: String, Codable {
    case libraryEvolution = "library evolution"
    case needsInvestigation = "needs investigation"
    case support = "support"
}

enum NodeID: String, Codable {
    case mdu6TGFiZWwxOTU5NDA3Mjgw = "MDU6TGFiZWwxOTU5NDA3Mjgw"
    case mdu6TGFiZWwyMDY5MjkyNjg = "MDU6TGFiZWwyMDY5MjkyNjg="
    case mdu6TGFiZWwyMDcxMjcyMTM = "MDU6TGFiZWwyMDcxMjcyMTM="
}

// MARK: - PullRequest
struct PullRequest: Codable {
    let url, htmlURL: String
    let diffURL: String
    let patchURL: String

    enum CodingKeys: String, CodingKey {
        case url
        case htmlURL = "html_url"
        case diffURL = "diff_url"
        case patchURL = "patch_url"
    }
}

typealias issueList = [IssueListElement]

