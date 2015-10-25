//
//  OfferOverViewController.swift
//  INeedA
//
//  Created by Peyman Mortazavi on 10/24/15.
//  Copyright © 2015 Money2020. All rights reserved.
//

import UIKit
import SnapKit
import MapKit

class OfferDetailsModel {
    var Job: String = ""
    var Address: String = ""
    var Cost: String = ""
    var Description: String = ""
    var FullName: String = ""
    var PhoneNumber: String = ""
}

class OfferDetailsViewController: UIViewController {
    
    @IBOutlet weak var addressLabel: UITextView!
    @IBOutlet weak var phoneLabel: UITextView!
    @IBOutlet weak var payLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var mapContainer: UIView!
    var model: OfferDetailsModel = OfferDetailsModel()
    
    override func viewDidLoad() {
        
        self.title = "Cleaner"
        
        let map = MKMapView()
        mapContainer.addSubview(map)
        map.snp_makeConstraints { (make) -> Void in
            make.left.right.top.bottom.equalTo(mapContainer);
        }
        
        
    }
    
}
