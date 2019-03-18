//
//  WeatherLocation.swift
//  WeatherGift
//
//  Created by Christopher Knapp on 3/16/19.
//  Copyright © 2019 Christopher Knapp. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class WeatherLocation {
    var name = ""
    var coordinates = ""
    var currentTemp = "--"
    var currentSummary = ""
    var currentIcon = ""
    
    
    func getWeather(completed: @escaping ()-> ()){
        let weatherURL = urlBase + urlAPIKey + coordinates
        
        Alamofire.request(weatherURL).responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                if let temperature = json["currently"]["temperature"].double {
                    print(temperature)
                    let roundedTemp = String(format: "%3.f", temperature)
                    self.currentTemp = roundedTemp + "°"
                } else {
                    print("couldnt get temp")
                    if let summary = json["daily"]["summary"].string {
                        self.currentSummary = summary
                    } else {
                        print("couldn't get summary")
                    }
                    if let icon = json["currently"]["icon"].string {
                        self.currentIcon = icon
                    } else {
                        print("couldn't get icon")
                    }

                }
            case .failure(let error):
                print(error)
            }
            completed()
        }
    }
}

