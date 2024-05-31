//
//  MainViewController.swift
//  WeatherClient
//
//  Created by Алина Власенко on 20.05.2024.
//

import UIKit

class MainViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemGreen
        loadData()
    }
}

// MARK: - Private
private extension MainViewController {
    
    // logic to check if data exists in CoreData
    func loadData() {
        // if we have the latest data, we show them
        if let storeData = fetchAllWeatherData().last {
            dataDidLoad(with: storeData)
        } else {
            // if there is no data in CoreData
            // 1 - download from АРI
            let network = Network.shared
            if let weatherInfo = network.fetchWeather()?.last {
                // 2 - stored in CoreData
                storeWeatherInfo(weatherInfo)
            }
            // 3 - get data from CoreData
            if let data = fetchAllWeatherData().last {
                // 4 - show the data on the UI
                dataDidLoad(with: data)
            }
        }
    }
    
    func dataDidLoad(with data: CDWeatherInfo) {
        debugPrint("temp is: \(data.temp)")
    }
}
