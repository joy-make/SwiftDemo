//
//  WebVC.swift
//  SwiftDemo
//
//  Created by Joymake on 2019/6/6.
//  Copyright © 2019 IB. All rights reserved.
//

import UIKit
import WebKit

class WebVC: UIViewController ,WKNavigationDelegate{
    lazy var webView: WKWebView = {
        let webView = WKWebView()
        return webView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.frame = self.view.bounds
        webView.navigationDelegate = self
//        webView.load(URLRequest.init(url: URL.init(string: "http://www.163.com")!))
        self.view.addSubview(webView)
        let url = URL(string: "https://www.jianshu.com/p/a56addca1c6b")
        let request = URLRequest(url: url!)
        webView.load(request)
    }

    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        print("开始加载")
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        print("开始数据返回")
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("加载成功")
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        print("加载失败")
    }
}
