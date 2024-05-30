//
//  Network.swift
//  WeatherClient
//
//  Created by Алина Власенко on 30.05.2024.
//

import Foundation

class Network {
    
    static let shared = Network()
    
    func fetchWeather() {
        
        guard let url = Urls.weatherAPIUrl else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.request(
            request: request,
            expecting: DMWeatherInfo.self
        ) { result in
            switch result {
            case .success(let colors):
                DispatchQueue.main.async {
                    print(colors)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
