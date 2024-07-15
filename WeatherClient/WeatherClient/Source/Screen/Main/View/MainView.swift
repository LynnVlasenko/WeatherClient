//
//  MainView.swift
//  WeatherClient
//
//  Created by Алина Власенко on 06.06.2024.
//

import UIKit

class MainView: UIView {
    
    weak var delegate: MainViewDelegate?
    
    // MARK: - UI
    // background
    private let bgImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Constant.weatherBack)
        return imageView
    }()
    
    // top
    private let myLocationLabel: UILabel = {
        let label = UILabel()
        label.text = "My Location"
        label.font = UIFont(name: Constant.GSLight, size: Constant.dataLargeHeaderFont)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    private let cityNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Constant.GSSemiBold, size: Constant.dataLabelFont)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    private let tempLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Constant.GSLight, size: Constant.tempLabelFont)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    private let skyStateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Constant.GS, size: Constant.dataLabelFont)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    private let maxMinTempLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Constant.GS, size: Constant.dataLabelFont)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    // Detailes Block
    private let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.systemBlue.withAlphaComponent(Constant.bgAlphaC)
        view.layer.cornerRadius = Constant.bgRadius
        return view
    }()
    
    private let headerDetailesLabel: UILabel = {
        let label = UILabel()
        label.text = "DETAILES"
        label.font = UIFont(name: Constant.GS, size: Constant.blockTitleFont)
        label.textColor = UIColor.systemGray3.withAlphaComponent(Constant.blockTitleAlphaC)
        return label
    }()
    
    private let lineDetailesView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.systemGray3.withAlphaComponent(Constant.linesAlphaC)
        return view
    }()
    
    // feels like block
    private let feelsLikeView: UIView = {
        let view = UIView()
        return view
    }()
    
    private let feelsLikeIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: Constant.feelsLikeImg)
        imageView.tintColor = .white
        return imageView
    }()
    
    private let feelsLikeLabel: UILabel = {
        let label = UILabel()
        label.text = "FEELS LIKE"
        label.font = UIFont(name: Constant.GS, size: Constant.labelTitleFont)
        label.textColor = .white
        return label
    }()
    
    private let feelsLikeDataLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Constant.GS, size: Constant.dataLabelFont)
        label.textColor = .white
        return label
    }()
    
    private let lineFeelsLikeView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.systemGray3.withAlphaComponent(Constant.linesAlphaC)
        return view
    }()
    
    // humidity block
    private let humidityView: UIView = {
        let view = UIView()
        return view
    }()
    
    private let humidityIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: Constant.humImg)
        imageView.tintColor = .white
        return imageView
    }()
    
    private let humidityLabel: UILabel = {
        let label = UILabel()
        label.text = "HUMIDITY"
        label.font = UIFont(name: Constant.GS, size: Constant.labelTitleFont)
        label.textColor = .white
        return label
    }()
    
    private let humidityDataLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Constant.GS, size: Constant.dataLabelFont)
        label.textColor = .white
        return label
    }()
    
    private let lineHumidityView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.systemGray3.withAlphaComponent(Constant.linesAlphaC)
        return view
    }()
    
    // pressure block
    private let pressureView: UIView = {
        let view = UIView()
        return view
    }()
    
    private let pressureIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: Constant.pressImg)
        imageView.tintColor = .white
        return imageView
    }()
    
    private let pressureLabel: UILabel = {
        let label = UILabel()
        label.text = "PRESSURE"
        label.font = UIFont(name: Constant.GS, size: Constant.labelTitleFont)
        label.textColor = .white
        return label
    }()
    
    private let pressureDataLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Constant.GS, size: Constant.dataLabelFont)
        label.textColor = .white
        return label
    }()
    
    // MARK: - Override
    override init(frame: CGRect) {
        super.init(frame: frame)
        bgImageView.frame = bounds
        addSubviews()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Add Subviews
    func addSubviews() {
        
        addSubview(bgImageView)
        
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
    }
    
    // MARK: - Setup Layout
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
            myLocationLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor,
                                                 constant: Constant.topBetweenMainInfo),
            myLocationLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            myLocationLabel.widthAnchor.constraint(equalTo: widthAnchor, 
                                                   multiplier: Constant.widthMultiplOfLabel),
            myLocationLabel.heightAnchor.constraint(equalToConstant: Constant.heightOfMediumLabel)
        ]
        
        let cityNameLabelConstraint = [
            cityNameLabel.topAnchor.constraint(equalTo: myLocationLabel.bottomAnchor, constant: Constant.topBetweenElements),
            cityNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            cityNameLabel.widthAnchor.constraint(equalTo: widthAnchor, 
                                                 multiplier: Constant.widthMultiplOfLabel),
            cityNameLabel.heightAnchor.constraint(equalToConstant: Constant.heightOfMediumLabel)
        ]
        
        let tempLabelConstraint = [
            tempLabel.topAnchor.constraint(equalTo: cityNameLabel.bottomAnchor,
                                           constant: Constant.topBetweenMainInfo),
            tempLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            tempLabel.widthAnchor.constraint(equalTo: widthAnchor,
                                             multiplier: Constant.widthMultiplOfLabel),
            tempLabel.heightAnchor.constraint(equalToConstant: Constant.heightOfTempLabel)
        ]
        
        let skyStateLabelConstraint = [
            skyStateLabel.topAnchor.constraint(equalTo: tempLabel.bottomAnchor, constant: Constant.topBetweenElements),
            skyStateLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            skyStateLabel.widthAnchor.constraint(equalTo: widthAnchor, 
                                                 multiplier: Constant.widthMultiplOfLabel),
            skyStateLabel.heightAnchor.constraint(equalToConstant: Constant.heightOfLabel)
        ]
        
        let maxMinTempLabelConstraint = [
            maxMinTempLabel.topAnchor.constraint(equalTo: skyStateLabel.bottomAnchor, constant: Constant.topBetweenElements),
            maxMinTempLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            maxMinTempLabel.widthAnchor.constraint(equalTo: widthAnchor, 
                                                   multiplier: Constant.widthMultiplOfLabel),
            maxMinTempLabel.heightAnchor.constraint(equalToConstant: Constant.heightOfLabel)
        ]
        
        // detailesInfo
        let backgroundViewConstraint = [
            backgroundView.topAnchor.constraint(equalTo: maxMinTempLabel.bottomAnchor,
                                                constant: Constant.topBetweenBlocks),
            backgroundView.centerXAnchor.constraint(equalTo: centerXAnchor),
            backgroundView.widthAnchor.constraint(equalTo: widthAnchor, 
                                                  multiplier: Constant.widthMultiplOfView),
            backgroundView.heightAnchor.constraint(equalToConstant: Constant.heightOfBgView)
        ]
        
        let headerDetailesLabelConstraint = [
            headerDetailesLabel.topAnchor.constraint(equalTo: backgroundView.topAnchor,
                                                     constant: Constant.topBetweenElements),
            headerDetailesLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            headerDetailesLabel.widthAnchor.constraint(equalTo: backgroundView.widthAnchor, 
                                                       multiplier: Constant.widthMultiplOfLabel),
            headerDetailesLabel.heightAnchor.constraint(equalToConstant: Constant.heightOfBlockTitleLabel)
        ]
        
        let lineDetailesViewConstraint = [
            lineDetailesView.topAnchor.constraint(equalTo: headerDetailesLabel.bottomAnchor, 
                                                  constant: Constant.topBetweenElements),
            lineDetailesView.centerXAnchor.constraint(equalTo: centerXAnchor),
            lineDetailesView.widthAnchor.constraint(equalTo: backgroundView.widthAnchor, 
                                                    multiplier: Constant.widthMultiplOfView),
            lineDetailesView.heightAnchor.constraint(equalToConstant: Constant.heightOfLineView)
        ]
        
        // feelsLike
        let feelsLikeViewConstraint = [
            feelsLikeView.topAnchor.constraint(equalTo: lineDetailesView.bottomAnchor, 
                                               constant: Constant.topBetweenElements),
            feelsLikeView.centerXAnchor.constraint(equalTo: centerXAnchor),
            feelsLikeView.widthAnchor.constraint(equalTo: backgroundView.widthAnchor, 
                                                 multiplier: Constant.widthMultiplOfView),
            feelsLikeView.heightAnchor.constraint(equalToConstant: Constant.heightOfView)
        ]
        
        let feelsLikeIconConstraint = [
            feelsLikeIcon.centerYAnchor.constraint(equalTo: feelsLikeView.centerYAnchor),
            feelsLikeIcon.leadingAnchor.constraint(equalTo: feelsLikeView.leadingAnchor,
                                                   constant: Constant.leadingFeelsVToIcon),
            feelsLikeIcon.widthAnchor.constraint(equalToConstant: Constant.widthOfFeelsIcon),
            feelsLikeIcon.heightAnchor.constraint(equalToConstant: Constant.heightOfIcon)
        ]
        
        let feelsLikeLabelConstraint = [
            feelsLikeLabel.centerYAnchor.constraint(equalTo: feelsLikeView.centerYAnchor),
            feelsLikeLabel.leadingAnchor.constraint(equalTo: feelsLikeIcon.trailingAnchor,
                                                    constant: Constant.leadingFeelsFromIcon),
            feelsLikeLabel.heightAnchor.constraint(equalToConstant: Constant.heightOfLabel)
        ]
        
        let feelsLikeDataLabelConstraint = [
            feelsLikeDataLabel.centerYAnchor.constraint(equalTo: feelsLikeView.centerYAnchor),
            feelsLikeDataLabel.trailingAnchor.constraint(equalTo: feelsLikeView.trailingAnchor),
            feelsLikeDataLabel.heightAnchor.constraint(equalToConstant: Constant.heightOfLabel)
        ]
        
        let lineFeelsLikeViewConstraint = [
            lineFeelsLikeView.topAnchor.constraint(equalTo: feelsLikeView.bottomAnchor, 
                                                   constant: Constant.topBetweenElements),
            lineFeelsLikeView.centerXAnchor.constraint(equalTo: centerXAnchor),
            lineFeelsLikeView.widthAnchor.constraint(equalTo: backgroundView.widthAnchor, 
                                                     multiplier: Constant.widthMultiplOfView),
            lineFeelsLikeView.heightAnchor.constraint(equalToConstant: Constant.heightOfLineView)
        ]
        
        // humidity
        let humidityViewConstraint = [
            humidityView.topAnchor.constraint(equalTo: lineFeelsLikeView.bottomAnchor,
                                              constant: Constant.topBetweenElements),
            humidityView.centerXAnchor.constraint(equalTo: centerXAnchor),
            humidityView.widthAnchor.constraint(equalTo: backgroundView.widthAnchor,
                                                multiplier: Constant.widthMultiplOfView),
            humidityView.heightAnchor.constraint(equalToConstant: Constant.heightOfView)
        ]
        
        let humidityIconConstraint = [
            humidityIcon.centerYAnchor.constraint(equalTo: humidityView.centerYAnchor),
            humidityIcon.leadingAnchor.constraint(equalTo: humidityView.leadingAnchor),
            humidityIcon.widthAnchor.constraint(equalToConstant: Constant.widthOfIcon),
            humidityIcon.heightAnchor.constraint(equalToConstant: Constant.heightOfIcon)
        ]
        
        let humidityLabelConstraint = [
            humidityLabel.centerYAnchor.constraint(equalTo: humidityView.centerYAnchor),
            humidityLabel.leadingAnchor.constraint(equalTo: humidityIcon.trailingAnchor,
                                                   constant: Constant.leadingFromIcon),
            humidityLabel.heightAnchor.constraint(equalToConstant: Constant.heightOfLabel)
        ]
        
        let humidityDataLabelConstraint = [
            humidityDataLabel.centerYAnchor.constraint(equalTo: humidityView.centerYAnchor),
            humidityDataLabel.trailingAnchor.constraint(equalTo: humidityView.trailingAnchor),
            humidityDataLabel.heightAnchor.constraint(equalToConstant: Constant.heightOfLabel)
        ]
        
        let lineHumidityViewConstraint = [
            lineHumidityView.topAnchor.constraint(equalTo: humidityView.bottomAnchor, 
                                                  constant: Constant.topBetweenElements),
            lineHumidityView.centerXAnchor.constraint(equalTo: centerXAnchor),
            lineHumidityView.widthAnchor.constraint(equalTo: backgroundView.widthAnchor, 
                                                    multiplier: Constant.widthMultiplOfView),
            lineHumidityView.heightAnchor.constraint(equalToConstant: Constant.heightOfLineView)
        ]
        
        // pressure
        let pressureViewConstraint = [
            pressureView.topAnchor.constraint(equalTo: lineHumidityView.bottomAnchor,
                                              constant: Constant.topBetweenElements),
            pressureView.centerXAnchor.constraint(equalTo: centerXAnchor),
            pressureView.widthAnchor.constraint(equalTo: backgroundView.widthAnchor, 
                                                multiplier: Constant.widthMultiplOfView),
            pressureView.heightAnchor.constraint(equalToConstant: Constant.heightOfView)
        ]
        
        let pressureIconConstraint = [
            pressureIcon.centerYAnchor.constraint(equalTo: pressureView.centerYAnchor),
            pressureIcon.leadingAnchor.constraint(equalTo: pressureView.leadingAnchor),
            pressureIcon.widthAnchor.constraint(equalToConstant: Constant.widthOfIcon),
            pressureIcon.heightAnchor.constraint(equalToConstant: Constant.heightOfIcon)
        ]
        
        let pressureLabelConstraint = [
            pressureLabel.centerYAnchor.constraint(equalTo: pressureView.centerYAnchor),
            pressureLabel.leadingAnchor.constraint(equalTo: pressureIcon.trailingAnchor,
                                                   constant: Constant.leadingFromIcon),
            pressureLabel.heightAnchor.constraint(equalToConstant: Constant.heightOfLabel)
        ]
        
        let pressureDataLabelConstraint = [
            pressureDataLabel.centerYAnchor.constraint(equalTo: pressureView.centerYAnchor),
            pressureDataLabel.trailingAnchor.constraint(equalTo: pressureView.trailingAnchor),
            pressureDataLabel.heightAnchor.constraint(equalToConstant: Constant.heightOfLabel)
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
            cityNameLabel.text = String(city)
        }
        
        tempLabel.text = " " + String(format: Constant.roundedToZero, model.temp) + Constant.celsiusSigh
        
        skyStateLabel.text = "Cloudy"//model.relationship?.description // how I can get the data from relationship?
        
        maxMinTempLabel.text = Constant.highTempLabel
        + String(format: Constant.roundedToZero, model.tempMax) + Constant.celsiusSigh
        + "  " + Constant.lowTempLabel
        + String(format: Constant.roundedToZero, model.tempMin) + Constant.celsiusSigh
        
        feelsLikeDataLabel.text = String(format: Constant.roundedToZero, model.tempFeelsLike) + Constant.celsiusSigh
        humidityDataLabel.text = String(model.humidity) + " " + Constant.humSigh
        pressureDataLabel.text = String(model.pressure) + " " + Constant.presSigh
    }
}
