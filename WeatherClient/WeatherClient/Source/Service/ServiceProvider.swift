//
//  CoreDataService+Weather.swift
//  WeatherClient
//
//  Created by Алина Власенко on 06.06.2024.
//

import Foundation

// provider function is to create instances and return it as protocols
class ServiceProvider {
    
    static func networkService() -> NetworkServiceProtocol {
        
        let service = NetworkService()
        return service
    }
    
    static func coreDataService() -> CoreDataServiceProtocol {
        
        let service = CoreDataService.shared
        return service
    }
}
