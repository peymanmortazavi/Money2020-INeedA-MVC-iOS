//
//  LandingPage.swift
//  INeedA
//
//  Created by Peyman Mortazavi on 10/24/15.
//  Copyright © 2015 Money2020. All rights reserved.
//

import UIKit
import SIOSocket

class LandingPage: UIViewController {
    
    var socket: SIOSocket?

    override func viewDidLoad() {
        
        SIOSocket.socketWithHost("https://ineedaapp.herokuapp.com") { (socket) -> Void in
            
            self.title = "Profile"
            
            self.socket = socket;
            socket.on("request_pool", callback: { (data) -> Void in
                var dict = data[0]
                print(dict)
                
                dispatch_async(dispatch_get_main_queue()) {
                    
                    var msg = "Offer for " + (dict["job_tag"] as! String) + " for $" + (dict["pay_rate"] as! String) + "/hr\nDo you want it?"
                    
                    var alert = UIAlertController(title: "New Offer", message: msg, preferredStyle: UIAlertControllerStyle.Alert)
                    alert.addAction(UIAlertAction(title: "No", style: UIAlertActionStyle.Default, handler: nil))
                    self.presentViewController(alert, animated: true, completion: nil)
                    
                    alert.addAction(UIAlertAction(title: "Yes", style: .Default, handler: { action in
                        switch action.style{
                        case .Default:
                            self.performSegueWithIdentifier("GoToOfferDetailsPage", sender: nil)
                            
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
    
}
