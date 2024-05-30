//
//  MainViewController.swift
//  WeatherClient
//
//  Created by Алина Власенко on 20.05.2024.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemGreen
        Network.shared.fetchWeather()
    }


}

