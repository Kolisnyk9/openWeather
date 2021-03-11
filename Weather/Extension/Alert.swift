//
//  Alert.swift
//  Weather
//
//  Created by Andrew Kolisnyk on 09/03/2021.
//

import UIKit

extension ViewController {
    
    func PresentAlertController(with title: String?, message: String?, style: UIAlertController.Style, completionHandler: @escaping (String)-> Void ){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let search = UIAlertAction(title: "Search", style: .default) { (_) in
            if let cityName = alertController.textFields?.first?.text {
                let city = cityName.split(separator: " ").joined(separator: "%20")
                completionHandler(city)
            }
        }
        
        alertController.addTextField { (tf) in
            let city = ["Lviv","Kiyv","Odessa","Rivne","Chernivci"]
            tf.placeholder = city.randomElement()
        }
        
        let cancle = UIAlertAction(title: "Сancle", style: .cancel) { (_) in
            
        }
       
        alertController.addAction(search)
        alertController.addAction(cancle)
        present(alertController, animated: true, completion: nil)
    }
    
}
