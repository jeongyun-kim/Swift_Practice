//
//  Weather.swift
//  NetworkPractice
//
//  Created by 김정윤 on 6/6/24.
//

import Foundation

struct WeatherContainer: Decodable {
    let weather: [Weather]
    let main: Temperature
}

struct Weather: Decodable {
    let main: String
    let icon: String
    let description: String
}

struct Temperature: Decodable {
    let temp: Double
    let feels_like: Double
    let temp_min: Double
    let temp_max: Double
 
    var CelsiusMinTemp: Double {
        return temp_min - 273.15
    }
    var CelsiusMaxTemp: Double {
        return temp_max - 273.15
    }
}
