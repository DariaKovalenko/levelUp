//
//  APIConstants.swift
//  WeatherAppLecture
//
//  Created by Daria on 7/3/17.
//  Copyright © 2017 Daria. All rights reserved.
//

import Foundation

struct APIConstants {

    static let baseURL = "http://api.openweathermap.org/data/2.5/"
    static let apiKey = "ac3400280efc6f177fe46ab45083dac7"
    
    struct Path {
        static let weather = "weather"
        static let forecast = "forecast"
    }
    
    struct Keys {
        static let appID = "appid"
        
        struct Coordinates {
            static let latitude = "lat"
            static let longitude = "lon"
        }
    }
    
}
