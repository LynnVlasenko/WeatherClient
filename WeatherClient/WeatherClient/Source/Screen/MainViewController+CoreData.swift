//
//  MainViewController+CoreData.swift
//  WeatherClient
//
//  Created by Алина Власенко on 31.05.2024.
//

import Foundation

extension MainViewController {
    
    func storeWeatherInfo(_ info: DMWeatherInfo) {
        
        let coreDataService = CoreDataService.shared
        coreDataService.insertWeatherInfo(with: info)
    }
   
    func fetchAllWeatherData() -> [CDWeatherInfo] {
        
        let coreDataService = CoreDataService.shared
        return coreDataService.fetchAllWeatherInfo()
    }
}
