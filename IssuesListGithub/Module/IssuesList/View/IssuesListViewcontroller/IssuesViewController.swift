//
//  ViewController.swift
//  IssuesListGithub
//
//  Created by Sowrirajan S on 03/05/20.
//  Copyright © 2020 com.ssowri1. All rights reserved.
//

import UIKit

class IssuesViewController: ParentViewController {
    @IBOutlet weak var listTableView: UITableView!
    let activityindicatorView = UIActivityIndicatorView.init(style: .large)
    let viewModel = ListViewModel()
    var detailUrl: String = ""
    var pageNumber: Int = 0
    var state: State = .closed
    override func viewDidLoad() {
        super.viewDidLoad()
        listTableView.backgroundView = alertLabel
        updateUI(UrlQuery(state: .closed, page: pageNumber))
    }
    
    func updateUI(_ query: UrlQuery) {
        viewModel.fetchData(query: query, viewController: self, closureHanlder: { (_) in
            DispatchQueue.main.async {
                self.listTableView.reloadData()
                self.alertLabel.text = ""
            }
        })
    }
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is DetailViewController {
            let viewController: DetailViewController = (segue.destination as? DetailViewController)!
            viewController.htmlUrl = detailUrl
        }
    }
}

// MARK:- IB Actions
extension IssuesViewController {
    @IBAction func indexChanged(_ sender: UISegmentedControl) {
        updateUI(viewModel.segmentIndex(sender, &pageNumber, &state))
    }
}

// MARK:- TableView Datasource
extension IssuesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.issuesList?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ListTableViewCell else {
            return UITableViewCell()
        }
        cell.data = viewModel.setData(indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row+1 == viewModel.issuesList?.count {
            activityindicatorView.hidesWhenStopped = true
            listTableView.tableFooterView = activityindicatorView
            activityindicatorView.startAnimating()
            pageNumber += 1
            updateUI(UrlQuery(state: state, page: pageNumber))
        }
    }
}

// MARK:- TableView Delegates
extension IssuesViewController: UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        detailUrl = viewModel.getData(indexPath.row)
        self.performSegue(withIdentifier: SegueIdentifier.issuestodetail, sender: nil)
    }
}
