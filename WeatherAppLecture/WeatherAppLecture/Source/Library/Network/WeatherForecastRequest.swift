//
//  WeatherForecastRequest.swift
//  WeatherAppLecture
//
//  Created by Daria on 7/12/17.
//  Copyright © 2017 Daria. All rights reserved.
//

import UIKit

class WeatherForecastRequest: CoordinatesRequest {

    override var path: String {
        return APIConstants.Path.forecast
    }
    
    override var resultParser: ResultParser {
        return WeatherModelsParser()
    }
    
}

class WeatherModelsParser: ResultParser {
    
    func parseResult(_ result: Any?) -> Any? {
        guard let result = result as? [String : Any],
            let modelList = result["list"] as? [Any] else {
                return nil
        }
        
        let res: [WeatherModel] = modelList.flatMap { modelDict in
            return WeatherModel.init(result: modelDict)
        }
        
        return res
    }
    
}


/*
{"city":{"id":1851632,"name":"Shuzenji",
    "coord":{"lon":138.933334,"lat":34.966671},
    "country":"JP",
    "cod":"200",
    "message":0.0045,
    "cnt":38,
    "list":[{
        "dt":1406106000,
        "main":{
            "temp":298.77,
            "temp_min":298.77,
            "temp_max":298.774,
            "pressure":1005.93,
            "sea_level":1018.18,
            "grnd_level":1005.93,
            "humidity":87
            "temp_kf":0.26},
            "weather":[{"id":804,"main":"Clouds","description":"overcast clouds","icon":"04d"}],
            "clouds":{"all":88},
            "wind":{"speed":5.71,"deg":229.501},
            "sys":{"pod":"d"},
            "dt_txt":"2014-07-23 09:00:00"}
    ]}

 
 
 {"coord":{"lon":-122.09,"lat":37.39},
 "sys":{"type":3,"id":168940,"message":0.0297,"country":"US","sunrise":1427723751,"sunset":1427768967},
 "weather":[{"id":800,"main":"Clear","description":"Sky is Clear","icon":"01n"}],
 "base":"stations",
 "main":{
            "temp":285.68,
            "humidity":74,
            "pressure":1016.8,
            "temp_min":284.82,
            "temp_max":286.48},
 "wind":{"speed":0.96,"deg":285.001},
 "clouds":{"all":0},
 "dt":1427700245,
 "id":0,
 "name":"Mountain View",
 "cod":200}
*/

