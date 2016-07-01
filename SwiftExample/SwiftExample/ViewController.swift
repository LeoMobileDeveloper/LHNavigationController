//
//  ViewController.swift
//  SwiftExample
//
//  Created by huangwenchen on 16/6/29.
//  Copyright © 2016年 Leo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func toSecond(sender: AnyObject) {
        let svc = SecondController()
        self.navigationController?.pushViewController(svc, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.lh_barTintColor = UIColor.orangeColor()
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

