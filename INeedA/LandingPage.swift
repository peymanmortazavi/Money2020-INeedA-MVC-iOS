//
//  LandingPage.swift
//  INeedA
//
//  Created by Peyman Mortazavi on 10/24/15.
//  Copyright © 2015 Money2020. All rights reserved.
//

import UIKit
import SIOSocket

var socket: SIOSocket?

class LandingPage: UIViewController {

    override func viewDidLoad() {
        
        SIOSocket.socketWithHost("https://ineedaapp.herokuapp.com") { (sk) -> Void in
            
            self.title = "Profile"
            
            socket = sk;
            socket?.on("request_pool", callback: { (data) -> Void in
                
                var dict = data[0]
                
                dispatch_async(dispatch_get_main_queue()) {
                    
                    var msg = "Offer for " + (dict["job_tag"] as! String) + " for $" + (dict["pay_rate"] as! String) + "/hr\nDo you want it?"
                    
                    var alert = UIAlertController(title: "New Offer", message: msg, preferredStyle: UIAlertControllerStyle.Alert)
                    alert.addAction(UIAlertAction(title: "No", style: UIAlertActionStyle.Default, handler: nil))
                    self.presentViewController(alert, animated: true, completion: nil)
                    
                    alert.addAction(UIAlertAction(title: "Yes", style: .Default, handler: { action in
                        switch action.style {
                        case .Default:
                            var model = OfferDetailsModel()
                            model.fullName = dict["name"] as! String
                            model.address = (dict["address"] as! String) + "\n" + (dict["city"] as! String)
                            model.job = dict["job_tag"] as! String
                            model.pay = "$" + (dict["pay_rate"] as! String) + "/hr"
                            model.phoneNumber = dict["phone"] as! String
                            self.performSegueWithIdentifier("GoToOfferDetailsPage", sender: model)
                            
                        case .Cancel:
                            print("cancel")
                            
                        case .Destructive:
                            print("destructive")
                        }
                    }))
                    
                }
                
            })
        }
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var vc = segue.destinationViewController as! OfferDetailsViewController
        vc.model = sender as! OfferDetailsModel
    }
    
}
