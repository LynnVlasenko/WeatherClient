//
//  MainModelProtocol.swift
//  WeatherClient
//
//  Created by Алина Власенко on 06.06.2024.
//

import Foundation

protocol MainModelProtocol {
    
    // function to receive data and display it on the screen
    func loadData(with location: Location)
    func loadLastData()
}
