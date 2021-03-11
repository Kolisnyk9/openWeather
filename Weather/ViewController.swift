//
//  ViewController.swift
//  Weather
//
//  Created by Andrew Kolisnyk on 05/03/2021.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var maxTemperature: UILabel!
    @IBOutlet weak var minTemperature: UILabel!
    @IBOutlet weak var weatherName: UILabel!
    
    var weatherManager = WeatherManager()
    lazy var locationManager: CLLocationManager = {
        
        let lm = CLLocationManager()
        lm.delegate = self
        lm.requestAlwaysAuthorization()
        return lm
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        weatherManager.onComplition = { [weak self] currentWeather in
            guard let self = self else { return }
            self.updateInerface(currentWeather: currentWeather)
        }
        if CLLocationManager.locationServicesEnabled() {
            locationManager.requestLocation()
        }
    }
    
    @IBAction func searchButtonPressed(_ sender: UIButton) {
        self.PresentAlertController(with: "Місто", message: "Для отримання інофрмаці про погоду введіть місто", style: .actionSheet) { city in
            self.weatherImage.image = UIImage(systemName: "wand.and.stars.inverse")
            self.weatherManager.fetchCurrentWeather(withCity: city)
            
        }
    }
    func updateInerface(currentWeather: CurrentWeather){
        DispatchQueue.main.async {
            self.cityNameLabel.text = "\(currentWeather.cityName)"
            self.temperatureLabel.text = "\(currentWeather.temperatureString)°C"
            self.weatherImage.image = UIImage(systemName: currentWeather.conditionName)
            self.maxTemperature.text = "Max \(currentWeather.tempMaxString)°C"
            self.minTemperature.text = "Min  \(currentWeather.tempMinString)°C"
            self.weatherName.text = currentWeather.weatherName
        }
    }
}




