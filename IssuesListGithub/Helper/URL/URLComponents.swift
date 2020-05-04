//
//  URLComponents.swift
//  IssuesListGithub
//
//  Created by Sowrirajan S on 03/05/20.
//  Copyright © 2020 com.ssowri1. All rights reserved.
//

import UIKit

extension ApiConstansts {
    // configuring api
    static func configuration(query: [URLQueryItem]) -> URL {
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.path = path
        components.queryItems = query
        return components.url!
    }
    // conguring query
    static func configureQuery(data: UrlQuery) -> URL {
        let query: [URLQueryItem] = [
            URLQueryItem(name: "state", value: data.state?.rawValue),
            URLQueryItem(name: "page", value: "\(data.page)")
        ]
        return ApiConstansts.configuration(query: query)
    }
    // buliding url
    static func fetchUrl(state: State, page: Int) -> URL {
        return ApiConstansts.configureQuery(data: .init(state: state, page: page))
    }
}
