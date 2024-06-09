//
//  CoreDataService+Weather.swift
//  WeatherClient
//
//  Created by Алина Власенко on 31.05.2024.
//

import CoreData

// protocol for Controller interaction with CoreData
protocol CoreDataWeather {
   
    func insertWeatherInfo(with info: DMWeatherInfo)
    func fetchAllWeatherInfo() -> [CDWeatherInfo]
}

// MARK: - CoreDataWeather
extension CoreDataService: CoreDataWeather {
    
    // insert data from API to CoreData
    func insertWeatherInfo(with info: DMWeatherInfo) {
        
        let weatherInfoEntityDescription = NSEntityDescription.entity(forEntityName: "CDWeatherInfo", in: context)!
        guard let weatherInfoEntity = NSManagedObject(entity: weatherInfoEntityDescription, insertInto: context) as? CDWeatherInfo
        else {
            assertionFailure()
            return
        }
        
        weatherInfoEntity.id = Int32(info.id)
        weatherInfoEntity.cityName = info.name
        weatherInfoEntity.temp = info.main.temp
        weatherInfoEntity.tempMax = info.main.tempMax
        weatherInfoEntity.tempMin = info.main.tempMin
        weatherInfoEntity.tempFeelsLike = info.main.feelsLike
        weatherInfoEntity.pressure = Int32(info.main.pressure)
        weatherInfoEntity.humidity = Int32(info.main.humidity)
        
        for detailes in info.weather {
            if let detailesEntity = insertWeatherDetailes(with: detailes) {
                detailesEntity.relationship = weatherInfoEntity
            }
        }
        save(context: context)
    }
    
    func fetchAllWeatherInfo() -> [CDWeatherInfo] {
        let fetchRequest = CDWeatherInfo.fetchRequest()
        let fetchedResult = fetchDataFromEntity(CDWeatherInfo.self, fetchRequest: fetchRequest)
        
        return fetchedResult
    }
}

// MARK: - WeatherDetailes
private extension CoreDataService {
    
    // insert data from API (DMWeatherInfo.Weather) to CoreData (CDWeatherDetailes) and then create a relation in insertWeatherInfo (with info: DMWeatherInfo)
    func insertWeatherDetailes(with detailes: DMWeatherInfo.Weather) -> CDWeatherDetailes? {
        
        let weatherDetailesEntityDescription = NSEntityDescription.entity(forEntityName: "CDWeatherDetailes", in: context)!
        guard let weatherDetailesEntity = NSManagedObject(entity: weatherDetailesEntityDescription, insertInto: context) as? CDWeatherDetailes
        else {
            assertionFailure()
            return nil
        }
        
        weatherDetailesEntity.id = Int32(detailes.id)
        weatherDetailesEntity.mainInfo = detailes.main
        weatherDetailesEntity.detailse = detailes.description
        weatherDetailesEntity.icon = detailes.icon
        
        return weatherDetailesEntity
    }
}
