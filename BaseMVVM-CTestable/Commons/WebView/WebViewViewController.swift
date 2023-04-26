//
//  WebViewViewController.swift
//  BaseMVVM-CTestable
//
//  Created by Junior Margalho on 26/04/23.
//

import WebKit
import UIKit

class WebViewViewController: UIViewController, WKNavigationDelegate {
    var webView: WKWebView!
    let url: URL
    
    init(url: URL) {
        self.url = url
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true

    }
}
