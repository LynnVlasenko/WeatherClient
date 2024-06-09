//
//  NetworkService+Weather.swift
//  WeatherClient
//
//  Created by Алина Власенко on 06.06.2024.
//

import Foundation

typealias WeatherInfoCompletion = ((DMWeatherInfo?, Error?) -> ())

protocol NetworkServiceWeather {
    
    func loadWeather(for location: Location, completion: @escaping WeatherInfoCompletion)
}

// MARK: - NetworkService+Weather
extension NetworkService: NetworkServiceWeather {
    
    func loadWeather(for location: Location, completion: @escaping (DMWeatherInfo?, Error?) -> ()) {
        
        let urlString = "\(APIConstant.weatherUrl())?lat=\(location.latitude)&lon=\(location.longitude)&appid=\(APIConstant.appId)"
        
        guard let url = URL(string: urlString)
        else {
            assertionFailure("wrong url")
            return
        }
        
        var urlRequest = URLRequest(url: url)
        
        urlRequest.httpMethod = "GET"
        
        request(urlRequest: urlRequest) { (result: Result<DMWeatherInfo, Error>) in
            
            switch result {
            case .success(let value):
                completion(value, nil)
            
            case.failure(let error):
                completion(nil, error)
            }
        }
    }
}
