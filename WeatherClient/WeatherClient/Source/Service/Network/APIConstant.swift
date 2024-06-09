//
//  APIConstant.swift
//  WeatherClient
//
//  Created by Алина Власенко on 06.06.2024.
//

import Foundation

struct APIConstant {
    
    static let baseUrl = "https://api.openweathermap.org"
    static let dataPath = "/data"
    static let apiVersion = "2.5"
    static let weatherPath = "/weather"
    
    static let appId = "ccf629fe4cd5a83b229a01d635a970db"
    
    static func weatherUrl() -> String {
        return baseUrl + dataPath + "/" + apiVersion + weatherPath
    }
}
