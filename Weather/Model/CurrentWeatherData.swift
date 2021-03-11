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
/*
 {
   "weather": [
     {
       "id": 600,
       "main": "Snow",
       "description": "light snow",
       "icon": "13n"
     }
   ],
   "base": "stations",
   "main": {
     "temp": 271.04,
     "feels_like": 266.22,
     "temp_min": 270.93,
     "temp_max": 271.15,
     "pressure": 1020,
     "humidity": 74
   },
   "visibility": 10000,
   "wind": {
     "speed": 3,
     "deg": 90
   },
   "clouds": {
     "all": 75
   },
   "dt": 1615310220,
   "sys": {
     "type": 1,
     "id": 8909,
     "country": "UA",
     "sunrise": 1615265430,
     "sunset": 1615306717
   },
   "timezone": 7200,
   "id": 702550,
   "name": "Lviv",
   "cod": 200
 }
 */
