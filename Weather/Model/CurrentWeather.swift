//
//  CurrentWeather.swift
//  Weather
//
//  Created by Andrew Kolisnyk on 09/03/2021.
//

import Foundation
struct CurrentWeather{
    
    let cityName: String
    let id: Int
    var weatherName: String {
        switch id {
        case 200...232: return "Thunderstorm"
        case 300...321: return "Drizzle"
        case 500...531: return "Rain"
        case 600...622: return "Snow"
        case 701...781: return "Mist"
        case 800:       return "Clear sky"
        case 800...804: return "Cloudy"
            
        default:
            return ""
        }
    }
    var conditionName: String {
        switch id {
        case 200...232: return "cloud.bolt.fill"
        case 300...321: return "cloud.drizzle.fill"
        case 500...531: return "cloud.rain.fill"
        case 600...622: return "cloud.snow.fill"
        case 701...781: return "smoke.fill"
        case 800:       return "sun.min.fill"
        case 800...804: return "cloud.fill"
            
        default:
            return ""
        }
    }
    
    let temp: Double
    var temperatureString:String {
        return String(format: "%.0f", temp)
    }
    
    let feelsLike:Double
    var feelsLikeString: String{
        return String(format: "%.0f", feelsLike)
    }
    
    let tempMin: Double
    var tempMinString: String{
        return String(format: "%.1f", tempMin)
    }
    
    let tempMax: Double
    var tempMaxString: String{
        return String(format: "%.1f", tempMax)
    }
    
    
    init?(CurrentWeatherData: CurrentWeatherData) {
        cityName = CurrentWeatherData.name
        id = CurrentWeatherData.weather.first!.id
        temp = CurrentWeatherData.main.temp
        feelsLike = CurrentWeatherData.main.feelsLike
        tempMin = CurrentWeatherData.main.tempMin
        tempMax = CurrentWeatherData.main.tempMax
    }
}
