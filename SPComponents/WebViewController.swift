//
//  WebViewController.swift
//  pizza-delivery
//
//  Created by Alexandru Corut on 17/01/2019.
//  Copyright © 2019 Alexandru Corut. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {
    
    var urlString: String?
    let webView = UIWebView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(webView)
        webView.fillSuperview()
        
        loadUrl()
    }
    
    func loadUrl() {
        guard let urlString = urlString, let url = URL(string: urlString) else { return }
        let urlRequest = URLRequest(url: url)
        webView.loadRequest(urlRequest)
    }
}
