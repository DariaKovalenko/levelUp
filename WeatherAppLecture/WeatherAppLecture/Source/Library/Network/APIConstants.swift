//
//  APIConstants.swift
//  WeatherAppLecture
//
//  Created by Daria on 7/3/17.
//  Copyright © 2017 Daria. All rights reserved.
//

import Foundation

struct APIConstants {

    static let baseURL = "http://openweathermap.org/data/2.5/"
    static let apiKey = "b1b15e88fa797225412429c1c50c122a1"
    
    struct Path {
        static let weather = "weather"
    }
    
    struct Keys {
        static let appID = "appid"
        
        struct Coordinates {
            static let latitude = "lat"
            static let longitude = "lon"
        }
    }
    
}
