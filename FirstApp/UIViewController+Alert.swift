//
//  UIViewController+Alert.swift
//  FirstApp
//
//  Created by Takayuki Kamezawa on 2017/10/16.
//  Copyright © 2017年 Takayuki Kamezawa. All rights reserved.
//

import UIKit

extension UIViewController {
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (_) in
            print("close alert")
        }))
        present(alert, animated: true, completion: nil)
    }
}
