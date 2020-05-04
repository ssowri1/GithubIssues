//
//  ListTableViewDataSource.swift
//  IssuesListGithub
//
//  Created by Sowrirajan S on 03/05/20.
//  Copyright © 2020 com.ssowri1. All rights reserved.
//

import UIKit

class ListTableViewDataSource: NSObject, UITableViewDelegate {
    let viewModel: ListViewModel? = nil
    var issuesList: issueList?

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }

}

extension ListTableViewDataSource: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.issuesList?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ListTableViewCell else {
            return UITableViewCell()
        }
        cell.data = viewModel?.setData(indexPath.row)
        return cell
    }
}
