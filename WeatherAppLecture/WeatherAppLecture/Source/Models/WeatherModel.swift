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
    let weatherDescription: String?
    let weatherIconPath: String?
    let windSpeed: Float?
    
    var imagePath: String? {
        return weatherIconPath.map { "http://openweathermap.org/img/w/" + $0 + ".png" }
    }
    
    init(temperature: Float, weatherDescription: String?, weatherIconPath: String?, windSpeed: Float?) {
        self.temperature = temperature
        self.weatherDescription = weatherDescription
        self.windSpeed = windSpeed
        self.weatherIconPath = weatherIconPath
    }
    
}

class WeatherModelParser: ResultParser {

    func parseResult(_ result: Any?) -> Any? {
        guard let resultDict = result as? [String : Any],
            let mainDict = resultDict["main"] as? [String : Any],
            let temperature = mainDict["temp"] as? Float
            else {
                return nil
        }
        
        let weatherDict = (resultDict["weather"] as? [[String : Any]])?.first
        let description = weatherDict?["description"] as? String
        let windDict = resultDict["wind"]
        let windSpeed = windDict as? Float
        
        
        let iconName = weatherDict?["icon"] as? String
        
        return WeatherModel(temperature: temperature,
                            weatherDescription: description,
                            weatherIconPath: iconName,
                            windSpeed: windSpeed)
    }
    
    /*
    {"coord":{"lon":139,"lat":35},
    "sys":{"country":"JP","sunrise":1369769524,"sunset":1369821049},
    "weather":[{"id":804,"main":"clouds","description":"overcast clouds","icon":"04n"}],
    "main":{"temp":289.5,"humidity":89,"pressure":1013,"temp_min":287.04,"temp_max":292.04},
    "wind":{"speed":7.31,"deg":187.002},
    "rain":{"3h":0},
    "clouds":{"all":92},
    "dt":1369824698,
    "id":1851632,
    "name":"Shuzenji",
    "cod":200}
    
    */

}
