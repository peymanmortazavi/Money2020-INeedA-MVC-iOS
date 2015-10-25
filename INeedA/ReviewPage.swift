//
//  ReviewPage.swift
//  INeedA
//
//  Created by Peyman Mortazavi on 10/25/15.
//  Copyright © 2015 Money2020. All rights reserved.
//

import UIKit

class ReviewPage: UIViewController {
    override func viewDidLoad() {
        self.navigationItem.title = "Review Customer"
        self.navigationItem.setHidesBackButton(true, animated:true);
        

        let barbutton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.Done, target: self, action: Selector("done"))
        self.navigationItem.setRightBarButtonItem(barbutton, animated: false)
        
        barbutton.setTitleTextAttributes([NSFontAttributeName : UIFont(name: "Avenir-Light", size: 18)!,
            NSForegroundColorAttributeName : UIColor.lightTextColor()],
            forState: UIControlState.Normal)
    }
    
    func done () {
        self.navigationController?.popToRootViewControllerAnimated(true);
    }
}
