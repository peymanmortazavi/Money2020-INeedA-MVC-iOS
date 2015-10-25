//
//  MainNavigationController.swift
//  INeedA
//
//  Created by Peyman Mortazavi on 10/24/15.
//  Copyright © 2015 Money2020. All rights reserved.
//

import Foundation
import UIKit

class MainNavigationController : UINavigationController {
    
    override func viewDidLoad() {
        

        let font = UIFont(name: "Avenir-Light", size: 22)
        if let font = font {
            UINavigationBar.appearance().titleTextAttributes = [NSFontAttributeName : font, NSForegroundColorAttributeName : UIColor.whiteColor()]
            
            UINavigationBar.appearance().tintColor = UIColor.lightGrayColor()
            UINavigationBar.appearance().setBackgroundImage(UIImage(named: "NavBackground"), forBarMetrics: UIBarMetrics.Default);
        }
        
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
}