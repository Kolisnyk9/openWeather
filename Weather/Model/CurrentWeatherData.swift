//
//  CurrentWeatherData.swift
//  Weather
//
//  Created by Andrew Kolisnyk on 09/03/2021.
//

import Foundation

struct CurrentWeatherData: Codable {
    let name: String
    let weather: [Weather]
    let main: Main
}


struct Weather: Codable {
    let id: Int
}

struct Main: Codable {
    let temp, feelsLike, tempMin, tempMax: Double
    
    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
    }
}

