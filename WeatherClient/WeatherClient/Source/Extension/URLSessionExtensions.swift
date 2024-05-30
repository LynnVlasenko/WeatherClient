//
//  URLSessionExtensions.swift
//  WeatherClient
//
//  Created by Алина Власенко on 30.05.2024.
//

import Foundation

extension URLSession {
    
    enum CustomError: Error {
        case invalidUrl
        case invalidData
    }
    
    func request<T: Decodable>(
        request: URLRequest?,
        expecting: T.Type,
        complition: @escaping (Result<T, Error>) -> Void) {
            guard let request = request else {
                complition(.failure(CustomError.invalidUrl))
                return
            }
            
        DispatchQueue.global(qos: .default).async {
            let task = self.dataTask(with: request) { data, _, error in
                
                guard let data = data else {
                    if let error = error {
                        debugPrint(error.localizedDescription)
                        complition(.failure(error))
                    } else {
                        complition(.failure(CustomError.invalidData))
                    }
                    debugPrint("no data")
                    return
                }
                
                do {
                    let result = try JSONDecoder().decode(expecting, from: data)
                    debugPrint(result)
                    complition(.success(result))
                } catch {
                    debugPrint(error.localizedDescription)
                    complition(.failure(error))
                }
            }
            task.resume()
        }
    }
}
