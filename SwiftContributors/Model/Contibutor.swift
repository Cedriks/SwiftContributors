//
//  Contibutor.swift
//  SwiftContributors
//
//  Created by Cedrik on 13/07/2023.
//

import Foundation

struct Result: Codable {
    let contibutors: [Contributor]?
}

struct Contributor: Codable {
    let login: String?
    let id: Int?
    let nodeId: String?
    let avatarUrl: URL?
    let gravatarId: String?
    let url: URL?
    let htmlUrl: URL?
    let followersUrl: URL?
    let followingUrl: URL? = URL(string: "")
    let gistsUrl: URL? = URL(string: "")
    let starredUrl: URL? = URL(string: "")
    let subscriptionsUrl: URL?
    let organizationsUrl: URL?
    let reposUrl: URL?
    let eventsUrl: URL? = URL(string: "")
    let receivedEventsUrl: URL?
    let type: String?
    let siteAdmin: Bool?
    let contributions: Int?

    private enum CodingKeys: String, CodingKey {
        case login
        case id
        case nodeId = "node_id"
        case avatarUrl = "avatar_url"
        case gravatarId = "gravatar_id"
        case url
        case htmlUrl = "html_url"
        case followersUrl = "followers_url"
        case followingUrl = "following_url"
        case gistsUrl = "gists_url"
        case starredUrl = "starred_url"
        case subscriptionsUrl = "subscriptions_url"
        case organizationsUrl = "organizations_url"
        case reposUrl = "repos_url"
        case eventsUrl = "events_url"
        case receivedEventsUrl = "received_events_url"
        case type
        case siteAdmin = "site_admin"
        case contributions
    }
}
