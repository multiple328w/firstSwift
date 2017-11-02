//
//  WebViewController+extension.swift
//  FirstApp
//
//  Created by Takayuki Kamezawa on 2017/10/27.
//  Copyright © 2017年 Takayuki Kamezawa. All rights reserved.
//

import Foundation
import WebKit

extension WebViewController: WKNavigationDelegate {

    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        print("request = \(String(describing: navigationAction.request.url))")
        decisionHandler(.allow)
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("finish \(navigation)")
    }
}
