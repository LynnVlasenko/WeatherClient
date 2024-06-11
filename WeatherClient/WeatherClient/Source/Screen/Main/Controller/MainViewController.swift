//
//  MainViewController.swift
//  WeatherClient
//
//  Created by Алина Власенко on 06.06.2024.
//

import UIKit
import CoreLocation

class MainViewController: UIViewController {
    
    var model: MainModelProtocol!
    var contentView: MainViewProtocol!
    
    var manager = CLLocationManager()
    
    override func loadView() {
        // configuration and initialization of the view
        let mainView = MainView(frame: .zero)
        //mainView.backgroundColor = .systemBlue
        mainView.delegate = self
        contentView = mainView
        view = mainView
        setupLocation()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // initialize the initial state
        setupInitialState()
        // get current location
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        model.loadLastData()
    }
    
    override func loadViewIfNeeded() {
        super.loadViewIfNeeded()
        model.loadLastData()
    }
    
    private func setupInitialState() {
        let mainModel = MainModel(delegate: self)
        model = mainModel
    }
}

// MARK: - MainViewDelegate
extension MainViewController: MainViewDelegate {
    
}

// MARK: - MainModelDelegate
extension MainViewController: MainModelDelegate {
    
    func dataDidLoad(with data: CDWeatherInfo) {
        
        // displaying data on screen UI elements
        contentView.setupWeather(model: data)
        print(data)
    }
}


extension MainViewController: CLLocationManagerDelegate {
    
    func setupLocation() {
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        
        switch manager.authorizationStatus {
        case .authorizedAlways, .authorizedWhenInUse:
            manager.startUpdatingLocation()
        case .notDetermined:
            manager.requestWhenInUseAuthorization()
            manager.startUpdatingLocation()
        case .denied, .restricted:
            print("denied") // Зробити тут не прінт, а алерт з виходом на зміну налаштувань, щоб дати доступ до локації. Тобто буде 2 кнопки Open Settings та Cansel
        @unknown default:
            break
        }
    }
    
    internal func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let first = locations.first else {
            return
        }
        let location = Location(latitude: first.coordinate.latitude, longitude: first.coordinate.longitude)
        
        DispatchQueue.main.async {
            self.model.loadData(with: location)
        }
        
        print("lat: \(first.coordinate.latitude), lon: \(first.coordinate.longitude)")
    }
}
