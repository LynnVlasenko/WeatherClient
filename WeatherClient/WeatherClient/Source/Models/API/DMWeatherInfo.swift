//
//  DMWeatherInfo.swift
//  WeatherClient
//
//  Created by Алина Власенко on 30.05.2024.
//

import Foundation

/// DM - Domain Model
struct DMWeatherInfo: Decodable {
    
    let id: Int
    let name: String
    let weather: [Weather]
    let main: Main
    
    struct Weather: Decodable {
        
        let id: Int
        let main: String
        let description: String
        let icon: String
    }
    
    struct Main: Decodable {
        let temp: Double
        let tempMax: Double
        let tempMin: Double
        let pressure: Int
        let humidity: Int
        let feelsLike: Double
        
        private enum CodingKeys: String, CodingKey {
            case temp
            case tempMax = "temp_min"
            case tempMin = "temp_max"
            case pressure
            case humidity
            case feelsLike = "feels_like"
        }
    }
}
