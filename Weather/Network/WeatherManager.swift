//
//  WeatherManager.swift
//  Weather
//
//  Created by Andrew Kolisnyk on 06/03/2021.
//

import Foundation
import CoreLocation
//protocol WeatherManagerDelegete: class {
//  func updateInterface(_: WeatherManager, currentWeather: CurrentWeather)
//}
class WeatherManager {
    
    var onComplition: ((CurrentWeather)->Void)?
    //    var delegate: WeatherManagerDelegete?
    func fetchCurrentWeather(withCity city: String){
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&units=metric&appid=\(apiKey)"
        print(urlString)
        perfomRequst(withURLString: urlString)
    }
    func fetchCurrentWeather(longitude: CLLocationDegrees, latitude: CLLocationDegrees){
        let urlString = "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&units=metric&appid=\(apiKey)"
        perfomRequst(withURLString: urlString)
    }
    
    fileprivate func perfomRequst(withURLString urlString: String) {
        guard let url = URL(string: urlString) else { return }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { (data, response, error) in
            if let data = data {
                if let currentWeather = self.parseJSON(withData: data){
                    self.onComplition?(currentWeather)
                    //                    self.delegate?.updateInterface(self, currentWeather: currentWeather)
                    print(currentWeather.cityName)
                }
                
            }
            if let error = error {
                print("JSON error \(error)")
            }
        }
        task.resume()
    }
    
    fileprivate func parseJSON(withData data: Data) -> CurrentWeather? {
        let decoder = JSONDecoder()
        do{
            let currentWeatherData = try decoder.decode(CurrentWeatherData.self, from: data)
            guard let currentWeather = CurrentWeather(CurrentWeatherData: currentWeatherData) else { return nil}
            return currentWeather
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        return nil
    }
    
}
