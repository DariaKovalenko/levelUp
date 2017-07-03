//
//  ViewController.swift
//  WeatherAppLecture
//
//  Created by Daria on 6/26/17.
//  Copyright © 2017 Daria. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    var apiRequest: APIRequest?
    
    @IBOutlet var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        apiRequest = WeatherCoordinateRequest(latitude: 35, longitude: 139)
        
    }

    @IBAction func execute(_ sender: Any) {
        apiRequest?.execute { (result, error) in
            
        }
    }
}

