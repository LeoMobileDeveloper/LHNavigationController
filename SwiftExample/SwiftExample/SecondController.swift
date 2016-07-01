//
//  SecondController.swift
//  SwiftExample
//
//  Created by huangwenchen on 16/7/1.
//  Copyright © 2016年 Leo. All rights reserved.
//

import Foundation
import UIKit

class SecondController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.lh_barTintColor = UIColor.blueColor()
        self.navigationItem.title = "Second";
        self.view.backgroundColor = UIColor.whiteColor()
        
        let leftItem = UIBarButtonItem(title: "Back", style: .Plain, target: self, action: #selector(SecondController.back))
        self.navigationItem.leftBarButtonItem = leftItem
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func back(){
        self.lh_navigationController.popViewControllerAnimated(true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
