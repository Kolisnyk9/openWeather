//
//  CLLocationManagerDelegate.swift
//  Weather
//
//  Created by Andrew Kolisnyk on 11/03/2021.
//

import Foundation
import CoreLocation


extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        let latitude = location.coordinate.latitude
        let longitude = location.coordinate.longitude
        weatherManager.fetchCurrentWeather(longitude: longitude, latitude: latitude)
        
    }
    
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Location error \(error.localizedDescription)")
    }
     
}
