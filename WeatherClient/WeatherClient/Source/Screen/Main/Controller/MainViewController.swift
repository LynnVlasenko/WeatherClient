//
//  MainViewController.swift
//  WeatherClient
//
//  Created by Алина Власенко on 06.06.2024.
//

import UIKit

class MainViewController: UIViewController {
    
    var model: MainModelProtocol!
    var contentView: MainViewProtocol!
    
    override func loadView() {
        // configuration and initialization of the view
        let mainView = MainView(frame: .zero)
        mainView.backgroundColor = .blue
        mainView.delegate = self
        contentView = mainView
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // initialize the initial state
        setupInitialState()
        // loading data and displaying it on the screen
        model.loadData()
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
        let dataToShow = String(data.temp)
        contentView.setupWeather(text: dataToShow)
    }
}
