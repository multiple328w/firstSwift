//
//  ViewController.swift
//  FirstApp
//
//  Created by Takayuki Kamezawa on 2017/10/12.
//  Copyright © 2017年 Takayuki Kamezawa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var actionButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        actionButton.backgroundColor = UIColor.blue
        print("view did load")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("will appear")
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("did appear")
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print("view will layoutSubviews")
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print("view did layoutSubviews")
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view dill disappear")
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("view did disappear")
    }


    @IBAction func didTapButton( button: UIButton) {
        print("did tap button \(button)")
    }

}

