//
//  ClosedIssuesViewController.swift
//  IssuesListGithub
//
//  Created by Sowrirajan S on 03/05/20.
//  Copyright © 2020 com.ssowri1. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: ParentViewController {
    @IBOutlet weak var webView: WKWebView!
    var htmlUrl: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        title = AppConstants.detailController
        self.view.addSubview(alertLabel)
        loadWebView()
    }
    func loadWebView() {
        webView.navigationDelegate = self
        webView.uiDelegate = self
        webView.isHidden = true
        if let urlString = htmlUrl {
            if let url = URL(string: urlString) {
                webView.load(URLRequest(url: url))
            }
        }
    }
}

extension DetailViewController: WKUIDelegate, WKNavigationDelegate {

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        webView.isHidden = false
        alertLabel.isHidden = true
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        webView.isHidden = false
    }
}
