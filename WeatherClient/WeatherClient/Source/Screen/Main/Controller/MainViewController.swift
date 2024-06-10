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
    
    var manager: CLLocationManager?
    
    override func loadView() {
        // configuration and initialization of the view
        let mainView = MainView(frame: .zero)
        //mainView.backgroundColor = .systemBlue
        mainView.delegate = self
        contentView = mainView
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // initialize the initial state
        setupInitialState()
        // get current location
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
        manager = CLLocationManager()
        manager?.delegate = self
        manager?.desiredAccuracy = kCLLocationAccuracyBest
        manager?.requestWhenInUseAuthorization()
        manager?.startUpdatingLocation()
    }
    
    internal func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let first = locations.first else {
            return
        }
        let location = Location(latitude: first.coordinate.latitude, longitude: first.coordinate.longitude)
        model.loadData(with: location)
        print("lat: \(first.coordinate.latitude), lon: \(first.coordinate.longitude)")
    }
}
