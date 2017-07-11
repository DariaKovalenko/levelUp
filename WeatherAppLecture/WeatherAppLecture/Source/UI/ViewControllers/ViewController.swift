//
//  ViewController.swift
//  WeatherAppLecture
//
//  Created by Daria on 6/26/17.
//  Copyright © 2017 Daria. All rights reserved.
//

import UIKit
import MapKit
import Kingfisher

class ViewController: UIViewController {

    var apiRequest: APIRequest?
    
    var weatherModel: WeatherModel? {
        didSet {
            if isViewLoaded {
                fillWithModel()
            }
        }
    }
    
    @IBOutlet var temperatureLabel: UILabel!
    @IBOutlet var weatherLabel: UILabel!
    @IBOutlet var speedLabel: UILabel!
    @IBOutlet var iconImageView: UIImageView!
    
    @IBOutlet var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fillWithModel()
        apiRequest = WeatherCoordinateRequest(latitude: 48.45, longitude: 35.016)
        
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        apiRequest?.cancel()
    }
    
    @IBAction func execute(_ sender: Any) {
        apiRequest?.execute { [weak self] (result, error) in
            self?.weatherModel = result as? WeatherModel
        }
    }
    
    private func fillWithModel() {
        let temperature = weatherModel?.temperature
        temperatureLabel.text = (temperature.map {  String($0) } ?? "-")  + " *C"
        weatherLabel.text = weatherModel?.weatherDescription.map { $0 } ?? "-"
        speedLabel.text = (weatherModel?.windSpeed.map(String.init) ?? "-") + " m/s"
        
        if let url = weatherModel?.imagePath.map({ URL.init(string: $0) }) {
            iconImageView.kf.setImage(with: url)
        }
    }
}

