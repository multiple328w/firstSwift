//
//  WebViewController.swift
//  FirstApp
//
//  Created by Takayuki Kamezawa on 2017/10/27.
//  Copyright © 2017年 Takayuki Kamezawa. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    @IBOutlet weak var webView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        addWebObserver()
//        webView.navigationDelegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        guard let url = URL(string: "https://www.google.com") else {
            return
        }
        webView.load(URLRequest(url: url))
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func didTap(reload: UIBarButtonItem) {
        webView.reload()
    }

    @IBAction func didTap(back: UIBarButtonItem) {
        if webView.canGoBack {
            webView.goBack()
        }
    }

    @IBAction func didTap(forward: UIBarButtonItem) {
        if webView.canGoForward {
            webView.goForward()
        }
    }

    private func addWebObserver() {
        webView.addObserver(self, forKeyPath: "estimatedProgress", options: .new, context: nil)
        webView.addObserver(self, forKeyPath: "title", options: .new, context: nil)
        webView.addObserver(self, forKeyPath: "loading", options: .new, context: nil)
        webView.addObserver(self, forKeyPath: "canGoBack", options: .new, context: nil)
        webView.addObserver(self, forKeyPath: "canGoForward", options: .new, context: nil)
    }

    private func removeWebObserver() {
        webView.removeObserver(self, forKeyPath: "estimatedProgress")
        webView.removeObserver(self, forKeyPath: "title")
        webView.removeObserver(self, forKeyPath: "loading")
        webView.removeObserver(self, forKeyPath: "canGoBack")
        webView.removeObserver(self, forKeyPath: "canGoForward")
    }

    deinit {
        removeWebObserver()
    }

    @IBOutlet weak var backButton: UIBarButtonItem!
    @IBOutlet weak var forwardButton: UIBarButtonItem!
    @IBOutlet weak var reloadButton: UIBarButtonItem!

    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        print("keyPath \(String(describing: keyPath))")
        if keyPath == "estimatedProgress" {

        }
        else if keyPath == "title" {
            navigationItem.title = webView.title
        }
        else if keyPath == "loading" {
            UIApplication.shared.isNetworkActivityIndicatorVisible = webView.isLoading
            // リロードボタンと読み込み停止ボタンの有効・無効を切り替える
            reloadButton.isEnabled = !webView.isLoading
            backButton.isEnabled = webView.canGoBack
            forwardButton.isEnabled = webView.canGoForward
        }
        else if keyPath == "canGoBack" {
            backButton.isEnabled = webView.canGoBack
        }
        else if keyPath == "canGorForward" {
            forwardButton.isEnabled = webView.canGoForward
        }
    }
}

