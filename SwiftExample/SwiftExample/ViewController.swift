//
//  ViewController.swift
//  SwiftExample
//
//  Created by huangwenchen on 16/6/29.
//  Copyright © 2016年 Leo. All rights reserved.
//

import UIKit
import LHNavigationController

class ViewController: UIViewController,LHNavigationControllerDelegate{
    
    @IBAction func toSecond(sender: AnyObject) {
        let svc = SecondController()
        self.navigationController?.pushViewController(svc, animated: true)
    }
    func viewControllerAfterController(controller: UIViewController?) -> UIViewController? {
        if controller == self {
            let svc = SecondController()
            return svc
        }
        return nil
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.lh_barTintColor = UIColor.orangeColor()
        self.lh_navigationController.lhDelegate = self;
        self.lh_navigationController.setNavigationBarHidden(false, animated: false)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

