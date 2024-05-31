//
//  Network.swift
//  WeatherClient
//
//  Created by Алина Власенко on 30.05.2024.
//

import Foundation

class Network {
    
    static let shared = Network()
    
    func fetchWeather() -> [DMWeatherInfo]? {
        
        var weatherAPI = [DMWeatherInfo]()
        
        guard let url = Urls.weatherAPIUrl
        else {
            assertionFailure()
            return nil
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.request(
            request: request,
            expecting: DMWeatherInfo.self
        ) { result in
            switch result {
            case .success(let weather):
                weatherAPI.append(weather)
                DispatchQueue.main.async {
                    print(weather)
                }
            case .failure(let error):
                print(error)
            }
        }
        return weatherAPI
    }
}
