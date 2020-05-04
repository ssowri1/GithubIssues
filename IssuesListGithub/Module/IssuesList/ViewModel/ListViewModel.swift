//
//  ListViewModel.swift
//  IssuesListGithub
//
//  Created by Sowrirajan S on 03/05/20.
//  Copyright © 2020 com.ssowri1. All rights reserved.
//

import UIKit

class ListViewModel: NSObject {
    var issuesList: issueList? = []
    func numberOfRowsInSection() -> Int {
        return issuesList?.count ?? 0
    }
    
    func setData(_ index: Int) -> IssueListElement? {
        guard index < issuesList?.count ?? 0 else { return nil }
        guard let issue = issuesList?[index] else { return nil }
        return issue
    }
    
    func getData(_ index: Int) -> String {
        guard index < issuesList?.count ?? 0 else { return "" }
        guard let issue = issuesList?[index] else { return "" }
        return issue.htmlURL
    }
    
    func fetchData(query: UrlQuery, viewController: UIViewController, closureHanlder: @escaping(_ status: Bool) -> Void) {
        let url = ApiConstansts.fetchUrl(state: query.state!, page: query.page)
        print(url)
        ServiceWorker.fetch(url: url, viewController: viewController) { (responseData: issueList) in
            if query.page == 0 {
                self.issuesList = responseData
            } else {
                self.issuesList?.append(contentsOf: responseData)
            }
            closureHanlder(true)
        }
    }
    
    func segmentIndex(_ sender: UISegmentedControl,
                      _ pageNumber: inout Int,
                      _ state: inout State) -> UrlQuery {
        switch sender.selectedSegmentIndex {
        case 0: state = .closed
        case 1: state = .open
        default: break
        }
        pageNumber = 0
        return UrlQuery(state: state, page: pageNumber)
    }
}
