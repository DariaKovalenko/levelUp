//
//  WeatherModel.swift
//  WeatherAppLecture
//
//  Created by Daria on 6/26/17.
//  Copyright © 2017 Daria. All rights reserved.
//

import UIKit


class WeatherModel {
    
    let temperature: Float
    var maxTemp: Float?
    var minTemp: Float?
    
    let weatherDescription: String?
    let weatherIconPath: String?
    let windSpeed: Float?
    
    var imagePath: String? {
        return weatherIconPath.map { "http://openweathermap.org/img/w/" + $0 + ".png" }
    }
    
    init?(result: Any?) {
        guard let resultDict = result as? [String : Any],
            let mainDict = resultDict["main"] as? [String : Any],
            let temperature = mainDict["temp"] as? Float
            else {
                return nil
        }
        
        let weatherDict = (resultDict["weather"] as? [[String : Any]])?.first
        self.weatherDescription = weatherDict?["description"] as? String
        
        let windDict = resultDict["wind"]
        self.windSpeed = windDict as? Float
        
        self.weatherIconPath = weatherDict?["icon"] as? String
    
        self.maxTemp = mainDict["temp_max"] as? Float
        self.minTemp = mainDict["temp_min"] as? Float
        self.temperature = temperature
    }
    
}
