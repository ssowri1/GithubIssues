//
//  ServiceWorker.swift
//  IssuesListGithub
//
//  Created by Sowrirajan S on 03/05/20.
//  Copyright © 2020 com.ssowri1. All rights reserved.
//

import UIKit

class ServiceWorker: NSObject {

    class func fetch<T: Codable>(url: URL, viewController: UIViewController, closureHandler: @escaping(T) -> Void) {
                
        URLSession.shared.dataTask(with: url) { (responseData, _, error) in
            
            let parentViewController = viewController as? ParentViewController
            
            guard error == nil else { return }
            
            guard let response = responseData else { return }
            
            do {
                let data = try JSONDecoder.init().decode(T.self, from: response)
                closureHandler(data)
            } catch {
                DispatchQueue.main.async {
                    parentViewController?.alertLabel.text = error.localizedDescription
                }
            }
        }.resume()
    }
}
