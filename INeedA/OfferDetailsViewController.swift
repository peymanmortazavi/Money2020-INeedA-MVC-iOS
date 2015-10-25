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
    var job: String = ""
    var address: String = ""
    var pay: String = ""
    var fullName: String = ""
    var phoneNumber: String = ""
}

class OfferDetailsViewController: UIViewController {
    
    @IBAction func finishJobClicked(sender: AnyObject) {
        
        socket?.emit("finished_job")
        print("sent finish line")
    }
    
    @IBOutlet weak var addressLabel: UITextView!
    @IBOutlet weak var phoneLabel: UITextView!
    @IBOutlet weak var payLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var mapContainer: UIView!
    var model: OfferDetailsModel = OfferDetailsModel()
    
    override func viewDidLoad() {
        
        self.title = model.job
        
        let map = MKMapView()
        mapContainer.addSubview(map)
        map.snp_makeConstraints { (make) -> Void in
            make.left.right.top.bottom.equalTo(mapContainer);
        }
        
        addressLabel.text = self.model.address
        phoneLabel.text = self.model.phoneNumber
        payLabel.text = self.model.pay
        nameLabel.text = self.model.fullName
        
        var geocoder = CLGeocoder()
        geocoder.geocodeAddressString(self.model.address, completionHandler: {(placemarks, error) -> Void in
            if let placemark = placemarks?.first {
                let coordinates:CLLocationCoordinate2D = placemark.location!.coordinate
                

                let annot = MKPointAnnotation()
                annot.coordinate = coordinates
                map.addAnnotation(annot)
            }
        })
        
    }
    
}
