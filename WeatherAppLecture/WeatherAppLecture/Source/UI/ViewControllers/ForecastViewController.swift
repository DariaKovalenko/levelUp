//
//  ForecastViewController.swift
//  WeatherAppLecture
//
//  Created by Daria on 7/12/17.
//  Copyright © 2017 Daria. All rights reserved.
//

import UIKit

extension UITableViewCell {
    @nonobjc class var defaultIdentifier: String {
        let classString = NSStringFromClass(self)
        
        return classString.components(separatedBy: ".").last ?? classString
    }
}

class WeatherCell: UITableViewCell {
    
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var weatherIcon: UIImageView!
    
    func fill(with weatherModel: WeatherModel) {
        let minTempString = weatherModel.minTemp.map { String($0) } ?? "-"
        let maxTempString = weatherModel.maxTemp.map { String($0) } ?? "-"
        descriptionLabel.text = minTempString + " " + maxTempString
        if let url = weatherModel.imagePath.map({ URL.init(string: $0) }) {
            weatherIcon.kf.setImage(with: url)
        }
    }
    
}



class ForecastViewController: UIViewController {

    var weatherModels: [WeatherModel] = []
    @IBOutlet var tableView: UITableView?
    
    var forecastRequest: WeatherForecastRequest?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        forecastRequest = WeatherForecastRequest(latitude: 48.45, longitude: 35.016)
        
        forecastRequest?.execute(completion: { [weak self] (result, error) in
            self?.weatherModels = result as? [WeatherModel] ?? []
            self?.tableView?.reloadData()
        })
    }

}

extension ForecastViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: WeatherCell.defaultIdentifier) as? WeatherCell else {
            fatalError("Cell is not initialized")
        }//"WeatherCell" //"WeatherAppLecture.WeatherCell"
    
        cell.fill(with: weatherModels[indexPath.row])
        
        return cell
    }
    
}

extension ForecastViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIViewController.init()
        DispatchQueue.main.async {
            self.present(vc, animated: true)
        }
    }
    
}


extension UIViewController: UICollectionViewDelegateFlowLayout {

}
