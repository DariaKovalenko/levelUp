//
//  WeatherModel.swift
//  WeatherAppLecture
//
//  Created by Daria on 6/26/17.
//  Copyright © 2017 Daria. All rights reserved.
//

import UIKit


class WeatherModel {
    
    enum SkyState: String {
        case clear = "Clear"
        case cloudy = "Cloudy"
        case rainy = "Rainy"
        case snowy = "Snowy"
    
        var icon: UIImage? {
            switch self {
            case .clear:
                return #imageLiteral(resourceName: "cloudy")
            default:
                return #imageLiteral(resourceName: "cloudy")
            }
        }
    }
    

    
}

class WeatherModelParser: ResultParser {

    func parseResult(_ result: Any?) -> Any? {
        return result
    }
    
}
