//
//  MainModel.swift
//  WeatherClient
//
//  Created by Алина Власенко on 06.06.2024.
//

import Foundation

class MainModel {
    
    weak var delegate: MainModelDelegate?
    
    let networkService: NetworkServiceWeather
    let storageService: CoreDataWeather
    
    init(delegate: MainModelDelegate? = nil) {
        self.delegate = delegate
        self.networkService = ServiceProvider.networkService()
        self.storageService = ServiceProvider.coreDataService()
    }
    
}

// MARK: - MainModelProtocol
extension MainModel: MainModelProtocol {
    
    func loadLastData() {
        // if we have the latest data in CoreData, we show them
        if let storeData = storageService.fetchAllWeatherInfo().last {
            delegate?.dataDidLoad(with: storeData)
        } else {
            delegate?.setupLocation()
        }
    }
    
    
    // logic to check if data exists in CoreData
    func loadData(with location: Location) {
        // get current location
            
            DispatchQueue.global(qos: .default).async { [weak self] in
                // if there is no data in CoreData
                // 1 - load the data from the АРI
                //guard let currentLocation = currentLocation else { return }
                self?.networkService.loadWeather(for: location) { [weak self] weatherInfo, error in
                    
                    DispatchQueue.main.async {
                        // if the data from the API is successfully loaded
                        guard let weather = weatherInfo
                        else {
                            assertionFailure("no data")
                            return
                        }
                        // 2 - stored in CoreData
                        self?.storageService.insertWeatherInfo(with: weather)
                        // 3 - get the data from CoreData
                        if let fetchedWeather = self?.storageService.fetchAllWeatherInfo().last {
                            // 4 - show the data on the UI
                            self?.delegate?.dataDidLoad(with: fetchedWeather)
                        }
                    }
                }
            }
        }
    }
