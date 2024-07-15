//
//  MainModelDelegate.swift
//  WeatherClient
//
//  Created by Алина Власенко on 06.06.2024.
//

import Foundation

protocol MainModelDelegate: AnyObject {
    
    // signal that the data is loaded and get the data to work with it
    func dataDidLoad(with data: CDWeatherInfo)
    func setupLocation()
}
