//
//  WeatherLocation.swift
//  WeatherGift
//
//  Created by Christopher Knapp on 3/25/19.
//  Copyright © 2019 Christopher Knapp. All rights reserved.
//

import Foundation

class WeatherLocation: Codable{
    var name: String
    var coordinates: String
    
    init(name: String, coordinates: String) {
        self.name = name
        self.coordinates = coordinates
    }
}
