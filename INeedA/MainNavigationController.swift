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
        

        let font = UIFont(name: "Avenir-Light", size: 20)
        if let font = font {
            UINavigationBar.appearance().titleTextAttributes = [NSFontAttributeName : font, NSForegroundColorAttributeName : UIColor.grayColor()]
        }

//        self.setViewControllers([OfferDetailsViewController()], animated: true)
        
    }
    
}