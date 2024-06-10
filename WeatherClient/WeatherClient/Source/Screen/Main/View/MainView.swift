//
//  MainView.swift
//  WeatherClient
//
//  Created by Алина Власенко on 06.06.2024.
//

import UIKit

class MainView: UIView {
    
    weak var delegate: MainViewDelegate?
    
    private let myLocationLabel: UILabel = {
        let label = UILabel()
        label.text = "My Location"
        label.font = UIFont(name: "GillSans-Light", size: 30)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    private let cityNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "GillSans-SemiBold", size: 20)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    private let tempLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "GillSans-Light", size: 90)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    private let skyStateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "GillSans", size: 20)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    private let maxMinTempLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "GillSans", size: 20)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    private let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.systemBlue.withAlphaComponent(0.1)
        view.layer.cornerRadius = 15
        return view
    }()
    
    private let bgImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "weatherBack")
        return imageView
    }()
    
    private let headerDetailesLabel: UILabel = {
        let label = UILabel()
        label.text = "DETAILES"
        label.font = UIFont(name: "GillSans", size: 14)
        label.textColor = UIColor.systemGray3.withAlphaComponent(0.4)
        return label
    }()
    
    private let lineDetailesView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.systemGray3.withAlphaComponent(0.3)
        return view
    }()
    
    // feels like block
    private let lineFeelsLikeView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.systemGray3.withAlphaComponent(0.3)
        return view
    }()
    
    private let feelsLikeView: UIView = {
        let view = UIView()
        return view
    }()
    
    private let feelsLikeIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "thermometer.medium")
        imageView.tintColor = .white
        return imageView
    }()
    
    private let feelsLikeLabel: UILabel = {
        let label = UILabel()
        label.text = "FEELS LIKE"
        label.font = UIFont(name: "GillSans", size: 18)
        label.textColor = .white
        return label
    }()
    
    private let feelsLikeDataLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "GillSans", size: 20)
        label.textColor = .white
        return label
    }()
    
    // humidity block
    private let lineHumidityView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.systemGray3.withAlphaComponent(0.3)
        return view
    }()
    
    private let humidityView: UIView = {
        let view = UIView()
        return view
    }()
    
    private let humidityIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "humidity.fill")
        imageView.tintColor = .white
        return imageView
    }()
    
    private let humidityLabel: UILabel = {
        let label = UILabel()
        label.text = "HUMIDITY"
        label.font = UIFont(name: "GillSans", size: 18)
        label.textColor = .white
        return label
    }()
    
    private let humidityDataLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "GillSans", size: 20)
        label.textColor = .white
        return label
    }()
    
    // pressure block
    private let pressureView: UIView = {
        let view = UIView()
        return view
    }()
    
    private let pressureIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "tirepressure")
        imageView.tintColor = .white
        return imageView
    }()
    
    private let pressureLabel: UILabel = {
        let label = UILabel()
        label.text = "PRESSURE"
        label.font = UIFont(name: "GillSans", size: 18)
        label.textColor = .white
        return label
    }()
    
    private let pressureDataLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "GillSans", size: 20)
        label.textColor = .white
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        bgImageView.frame = bounds
        addSubviews()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews() {
        [myLocationLabel, cityNameLabel, tempLabel, skyStateLabel, maxMinTempLabel, backgroundView].forEach {
            bgImageView.addSubview($0)
        }
        [headerDetailesLabel, lineDetailesView, feelsLikeView, lineFeelsLikeView, lineHumidityView, humidityView, pressureView].forEach {
            backgroundView.addSubview($0)
        }
        
        [feelsLikeIcon, feelsLikeLabel, feelsLikeDataLabel].forEach {
            feelsLikeView.addSubview($0)
        }
        
        [humidityIcon, humidityLabel, humidityDataLabel].forEach {
            humidityView.addSubview($0)
        }
        
        [pressureIcon, pressureLabel, pressureDataLabel].forEach {
            pressureView.addSubview($0)
        }
        
        addSubview(bgImageView)
    }
    
    func setupLayout() {
        [bgImageView, myLocationLabel, cityNameLabel, tempLabel, skyStateLabel, maxMinTempLabel, backgroundView, headerDetailesLabel, lineDetailesView, feelsLikeView, feelsLikeIcon, feelsLikeLabel, feelsLikeDataLabel, lineFeelsLikeView, lineHumidityView, humidityView, humidityIcon, humidityLabel, humidityDataLabel, pressureView, pressureIcon, pressureLabel, pressureDataLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        // background
        let bgImageViewConstraint = [
            bgImageView.topAnchor.constraint(equalTo: topAnchor),
            bgImageView.widthAnchor.constraint(equalTo: widthAnchor),
            bgImageView.heightAnchor.constraint(equalTo: heightAnchor)
        ]
        
        // topInfo
        let myLocationLabelConstraint = [
            myLocationLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            myLocationLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            myLocationLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.9),
            myLocationLabel.heightAnchor.constraint(equalToConstant: 30)
        ]
        
        let cityNameLabelConstraint = [
            cityNameLabel.topAnchor.constraint(equalTo: myLocationLabel.bottomAnchor, constant: 10),
            cityNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            cityNameLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.9),
            cityNameLabel.heightAnchor.constraint(equalToConstant: 30)
        ]
        
        let tempLabelConstraint = [
            tempLabel.topAnchor.constraint(equalTo: cityNameLabel.bottomAnchor, constant: 20),
            tempLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            tempLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.9),
            tempLabel.heightAnchor.constraint(equalToConstant: 70)
        ]
        
        let skyStateLabelConstraint = [
            skyStateLabel.topAnchor.constraint(equalTo: tempLabel.bottomAnchor, constant: 10),
            skyStateLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            skyStateLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.9),
            skyStateLabel.heightAnchor.constraint(equalToConstant: 20)
        ]
        
        let maxMinTempLabelConstraint = [
            maxMinTempLabel.topAnchor.constraint(equalTo: skyStateLabel.bottomAnchor, constant: 10),
            maxMinTempLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            maxMinTempLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.9),
            maxMinTempLabel.heightAnchor.constraint(equalToConstant: 20)
        ]
        
        // detailesInfo
        let backgroundViewConstraint = [
            backgroundView.topAnchor.constraint(equalTo: maxMinTempLabel.bottomAnchor, constant: 40),
            backgroundView.centerXAnchor.constraint(equalTo: centerXAnchor),
            backgroundView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.9),
            backgroundView.heightAnchor.constraint(equalToConstant: 158)
        ]
        
        let headerDetailesLabelConstraint = [
            headerDetailesLabel.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 10),
            headerDetailesLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            headerDetailesLabel.widthAnchor.constraint(equalTo: backgroundView.widthAnchor, multiplier: 0.9),
            headerDetailesLabel.heightAnchor.constraint(equalToConstant: 16)
        ]
        
        let lineDetailesViewConstraint = [
            lineDetailesView.topAnchor.constraint(equalTo: headerDetailesLabel.bottomAnchor, constant: 10),
            lineDetailesView.centerXAnchor.constraint(equalTo: centerXAnchor),
            lineDetailesView.widthAnchor.constraint(equalTo: backgroundView.widthAnchor, multiplier: 0.9),
            lineDetailesView.heightAnchor.constraint(equalToConstant: 0.3)
        ]
        
        // feelsLike
        let feelsLikeViewConstraint = [
            feelsLikeView.topAnchor.constraint(equalTo: lineDetailesView.bottomAnchor, constant: 10),
            feelsLikeView.centerXAnchor.constraint(equalTo: centerXAnchor),
            feelsLikeView.widthAnchor.constraint(equalTo: backgroundView.widthAnchor, multiplier: 0.9),
            feelsLikeView.heightAnchor.constraint(equalToConstant: 20)
        ]
        
        let feelsLikeIconConstraint = [
            feelsLikeIcon.centerYAnchor.constraint(equalTo: feelsLikeView.centerYAnchor),
            feelsLikeIcon.leadingAnchor.constraint(equalTo: feelsLikeView.leadingAnchor, constant: 2),
            feelsLikeIcon.widthAnchor.constraint(equalToConstant: 14),
            feelsLikeIcon.heightAnchor.constraint(equalToConstant: 20)
        ]
        
        let feelsLikeLabelConstraint = [
            feelsLikeLabel.centerYAnchor.constraint(equalTo: feelsLikeView.centerYAnchor),
            feelsLikeLabel.leadingAnchor.constraint(equalTo: feelsLikeIcon.trailingAnchor, constant: 14),
            feelsLikeLabel.heightAnchor.constraint(equalToConstant: 20)
        ]
        
        let feelsLikeDataLabelConstraint = [
            feelsLikeDataLabel.centerYAnchor.constraint(equalTo: feelsLikeView.centerYAnchor),
            feelsLikeDataLabel.trailingAnchor.constraint(equalTo: feelsLikeView.trailingAnchor),
            feelsLikeDataLabel.heightAnchor.constraint(equalToConstant: 20)
        ]
        
        let lineFeelsLikeViewConstraint = [
            lineFeelsLikeView.topAnchor.constraint(equalTo: feelsLikeView.bottomAnchor, constant: 10),
            lineFeelsLikeView.centerXAnchor.constraint(equalTo: centerXAnchor),
            lineFeelsLikeView.widthAnchor.constraint(equalTo: backgroundView.widthAnchor, multiplier: 0.9),
            lineFeelsLikeView.heightAnchor.constraint(equalToConstant: 0.3)
        ]
        
        // humidity
        let humidityViewConstraint = [
            humidityView.topAnchor.constraint(equalTo: lineFeelsLikeView.bottomAnchor, constant: 10),
            humidityView.centerXAnchor.constraint(equalTo: centerXAnchor),
            humidityView.widthAnchor.constraint(equalTo: backgroundView.widthAnchor, multiplier: 0.9),
            humidityView.heightAnchor.constraint(equalToConstant: 20)
        ]
        
        let humidityIconConstraint = [
            humidityIcon.centerYAnchor.constraint(equalTo: humidityView.centerYAnchor),
            humidityIcon.leadingAnchor.constraint(equalTo: humidityView.leadingAnchor),
            humidityIcon.widthAnchor.constraint(equalToConstant: 20),
            humidityIcon.heightAnchor.constraint(equalToConstant: 20)
        ]
        
        let humidityLabelConstraint = [
            humidityLabel.centerYAnchor.constraint(equalTo: humidityView.centerYAnchor),
            humidityLabel.leadingAnchor.constraint(equalTo: humidityIcon.trailingAnchor, constant: 10),
            humidityLabel.heightAnchor.constraint(equalToConstant: 20)
        ]
        
        let humidityDataLabelConstraint = [
            humidityDataLabel.centerYAnchor.constraint(equalTo: humidityView.centerYAnchor),
            humidityDataLabel.trailingAnchor.constraint(equalTo: humidityView.trailingAnchor),
            humidityDataLabel.heightAnchor.constraint(equalToConstant: 20)
        ]
        
        let lineHumidityViewConstraint = [
            lineHumidityView.topAnchor.constraint(equalTo: humidityView.bottomAnchor, constant: 10),
            lineHumidityView.centerXAnchor.constraint(equalTo: centerXAnchor),
            lineHumidityView.widthAnchor.constraint(equalTo: backgroundView.widthAnchor, multiplier: 0.9),
            lineHumidityView.heightAnchor.constraint(equalToConstant: 0.3)
        ]
        
        // pressure
        let pressureViewConstraint = [
            pressureView.topAnchor.constraint(equalTo: lineHumidityView.bottomAnchor, constant: 10),
            pressureView.centerXAnchor.constraint(equalTo: centerXAnchor),
            pressureView.widthAnchor.constraint(equalTo: backgroundView.widthAnchor, multiplier: 0.9),
            pressureView.heightAnchor.constraint(equalToConstant: 20)
        ]
        
        let pressureIconConstraint = [
            pressureIcon.centerYAnchor.constraint(equalTo: pressureView.centerYAnchor),
            pressureIcon.leadingAnchor.constraint(equalTo: pressureView.leadingAnchor),
            pressureIcon.widthAnchor.constraint(equalToConstant: 20),
            pressureIcon.heightAnchor.constraint(equalToConstant: 20)
        ]
        
        let pressureLabelConstraint = [
            pressureLabel.centerYAnchor.constraint(equalTo: pressureView.centerYAnchor),
            pressureLabel.leadingAnchor.constraint(equalTo: pressureIcon.trailingAnchor, constant: 10),
            pressureLabel.heightAnchor.constraint(equalToConstant: 20)
        ]
        
        let pressureDataLabelConstraint = [
            pressureDataLabel.centerYAnchor.constraint(equalTo: pressureView.centerYAnchor),
            pressureDataLabel.trailingAnchor.constraint(equalTo: pressureView.trailingAnchor),
            pressureDataLabel.heightAnchor.constraint(equalToConstant: 20)
        ]
        
        [bgImageViewConstraint, myLocationLabelConstraint, cityNameLabelConstraint, tempLabelConstraint, skyStateLabelConstraint, maxMinTempLabelConstraint, backgroundViewConstraint, headerDetailesLabelConstraint, lineDetailesViewConstraint, feelsLikeViewConstraint, feelsLikeIconConstraint, feelsLikeLabelConstraint, feelsLikeDataLabelConstraint, lineFeelsLikeViewConstraint, humidityViewConstraint, humidityIconConstraint, humidityLabelConstraint, humidityDataLabelConstraint, lineHumidityViewConstraint, pressureViewConstraint, pressureIconConstraint, pressureLabelConstraint, pressureDataLabelConstraint].forEach {
            NSLayoutConstraint.activate($0)
        }
    }
}

// MARK: - MainViewProtocol
extension MainView: MainViewProtocol {
    
    // displaying data on screen UI elements
    func setupWeather(model: CDWeatherInfo) {
        if let city = model.cityName {
            cityNameLabel.text = "\(city)"
        }
        tempLabel.text = " \(String(format: "%.0f", model.temp))°"
        skyStateLabel.text = "Cloudy"//model.relationship?.description // how I can get the data from relationship?
        maxMinTempLabel.text = "H: \(String(format: "%.0f", model.tempMax))°   L: \(String(format: "%.0f", model.tempMin))°"
        feelsLikeDataLabel.text = "\(String(format: "%.0f", model.tempFeelsLike))°"
        humidityDataLabel.text = "\(String(model.humidity)) %"
        pressureDataLabel.text = "\(String(model.pressure)) hPa"
    }
    
//    func setupWeatherDetailes(model: CDWeatherDetailes) {
//        skyStateLabel.text = model.mainInfo
//    }
}
